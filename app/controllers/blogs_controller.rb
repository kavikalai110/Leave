class BlogsController < ApplicationController
	before_action :authenticate_user!

	layout 'blog'

  def index
    @user = current_user
    @emp_leave_balance = EmployeeLeaveBalance.where(:user_id=>@user.id)
    @leave_availd = LeaveAvaildDetail.where(:user_id=>@user.id,:status=>'InProcess')
  end
  
  def new
  	@leave_type=LeaveType.all
  end

  def new_leave_type
  	@leave_type = LeaveType.new
  end

  def create
    @leave_type = LeaveType.create(:name=>params[:name],:total_leave=>params[:total_leave],:status=>'Active')
    @emp_leave_balance = EmployeeLeaveBalance.create_new_leave(@leave_type)
    flash[:notice]="The Leave Type Was Successfully Create"
    redirect_to "/users/#{current_user.id}/blogs/new"
  end

  def deleting_leave_type
    @leave_type = LeaveType.find_by_id(params[:id])
    @leave_type.destroy
    redirect_to "/users/#{current_user.id}/blogs/new"
  end
  
end
