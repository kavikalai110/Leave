class CreateLeaveAvaildDetails < ActiveRecord::Migration
  def change
    create_table :leave_availd_details do |t|
      t.integer :user_id
      t.integer :leave_type_id
      t.date    :from_date
      t.date    :to_date
      t.integer :no_of_days
      t.string  :status
      t.string  :reasion
      t.timestamps null: false
    end
  end
end
