class LeaveAvaildDetailsController < ApplicationController
	require 'date'
	layout 'blog'

  def index
    @leave_availd = LeaveAvaildDetail.where(:status=>'InProcess')
  end

	def new
		@leave_type =LeaveType.all
    end

    def create
      leave_type=params[:leave_type_id]
      from=params[:datepicker].to_date
      to=params[:datepicker1].to_date
      user = current_user
      reasion = params[:reasion]
      priveos = LeaveAvaildDetail.where('from_date >= (?) and to_date <= (?) and user_id =? and status!=?',from.strftime("%F"),to.strftime("%F"),user.id,'Approved')
       if priveos.blank?
       @leave_availd = LeaveAvaildDetail.create_user_leaves(user,from,to,leave_type,reasion)
        if @leave_availd
        flash[:notice]="The Leave Was Successfully Create"
        redirect_to '/'
        else
        flash[:notice]="The LeaveBalance Was Not is Not there"
        redirect_to '/'
        end
      else
        flash[:notice]="This Date Already Leave Applied"
        redirect_to '/'
      end
    end

    def edit
    	@leave_availd = LeaveAvaildDetail.where(:id=>params[:id])
    end

    def updating
     a=params[:datepicker].to_date
     b=params[:datepicker1].to_date
     c = (b - a).to_i
     @leave_update = LeaveAvaildDetail.update_leave(params,c)
     flash[:notice]="The Leave Was Successfully Updated"
     redirect_to "/"
    end

    def approval_leave
      leave = LeaveAvaildDetail.approve_leave(params[:id])
      if status ==true
        flash[:notice]="The Leave Was Successfully Approved"
        redirect_to "/"
      else
        flash[:notice]="The Leave Was Successfully Approved"
        redirect_to "/"
      end
    end

    def reject_leave
      leave =LeaveAvaildDetail.find(params[:id])
      if leave.present?
        leave.update_attribute("status","Rejected")
        flash[:notice]="The Leave Was Successfully Rejected"
        redirect_to "/"
      end
    end

    def cancel_leave
      leave =LeaveAvaildDetail.find(params[:id])
      if leave.present?
        UserMailer.cancel_leave(leave).deliver_now
        leave.destroy
        flash[:notice]="The Leave Was Successfully Canceld"
        redirect_to "/"
      end
    end
end
