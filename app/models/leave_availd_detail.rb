class LeaveAvaildDetail < ActiveRecord::Base
	belongs_to :user
	belongs_to :leave_type

	validates_presence_of :leave_type_id,{ message: "Please select Leave Type" }
	validates_presence_of :from_date
	validates_presence_of :to_date
	validates_presence_of :reasion
  after_create :apply_leave_of_mail

  def apply_leave_of_mail
    UserMailer.sending_mail(self).deliver_now
  end

	def self.create_user_leaves(user,from,to,leave,reasion)
		no_of_days = (to - from).to_i
    leave_balance = EmployeeLeaveBalance.find_by_leave_type_id_and_user_id(leave,user.id)
    if leave_balance.balance.to_i > no_of_days
        availd=self.new
        availd.user_id=user.id
        availd.leave_type_id =leave
        availd.from_date = from.strftime("%F")
        availd.to_date = to.strftime("%F")
        availd.no_of_days = no_of_days + 1
        availd.status = 'InProcess'
        availd.reasion = reasion
        status=availd.save!
    else
      status=false
    end
    return status
  end

    def self.update_leave(params,days)
      no_of_days = (params[:datepicker1].to_date - params[:datepicker].to_date).to_i
      leave= self.find_by_id(params[:id])
      leave.leave_type_id = params[:hobbies]
      leave.from_date = params[:datepicker]
      leave.to_date=params[:datepicker1]
      leave.no_of_days = days + 1
      leave.reasion = params[:reasion]
      leave.save!
    end

    def self.approve_leave(id)
      approve =self.find_by_id(id) 
      emp_leave_balance = EmployeeLeaveBalance.approved_leave_balance(approve)
      approve.update_attributes(status: 'Approved')

    end
end
