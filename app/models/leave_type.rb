class LeaveType < ActiveRecord::Base
	has_many :users
	has_many :employee_leave_balances, dependent: :destroy
	has_many :leave_availd_details, dependent: :destroy

	validates_uniqueness_of :name
	
	
end
