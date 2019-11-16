class EmployeeLeaveBalance < ActiveRecord::Base
	belongs_to :user
	belongs_to :leave_type

	def self.create_leave_balance(user)
	  @leave_type = LeaveType.all
        @leave_type.each do |leave|
        employee_leave = EmployeeLeaveBalance.create(:user_id=>user,:leave_type_id=>leave.id,:status=>'Active',:total=>leave.total_leave,:leave_availd=>0,:balance=>leave.total_leave)
        end
	end

	def self.create_new_leave(leave)
	  @user = User.all
	   @user.each do |u|
	   employee_leave = EmployeeLeaveBalance.create(:user_id=>u.id,:leave_type_id=>leave.id,:status=>'Active',:total=>leave.total_leave,:leave_availd=>0,:balance=>leave.total_leave)
	   end
    end

    def self.approved_leave_balance(leave)
        emp_balance=self.find_by_user_id_and_leave_type_id(leave.user.id,leave.leave_type_id)
        balance=emp_balance.balance.to_i
        days = leave.no_of_days.to_i
        if balance > days
          new_balance = balance - days 
          emp_balance.update_attributes(balance: new_balance.to_i,leave_availd: days)
          status=true
        else 
        status=false
        end
        return status
    end
end
