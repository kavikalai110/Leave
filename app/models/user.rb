class User < ActiveRecord::Base
	has_many :employee_leave_balances
	has_many :leave_types, through: :employee_leave_balances
  has_many :leave_availd_details

	after_create :create_leave_balance
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def create_leave_balance
    	EmployeeLeaveBalance.create_leave_balance(id)
    end
end
