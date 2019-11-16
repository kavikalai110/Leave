class CreateEmployeeLeaveBalances < ActiveRecord::Migration
  def change
    create_table :employee_leave_balances do |t|
      t.integer :user_id
      t.integer :leave_type_id
      t.string  :status
      t.integer :total
      t.integer :leave_availd
      t.integer :balance
      t.timestamps null: false
    end
  end
end
