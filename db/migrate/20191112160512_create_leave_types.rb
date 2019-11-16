class CreateLeaveTypes < ActiveRecord::Migration
  def change
    create_table :leave_types do |t|
      t.string  :name
      t.string  :status
      t.integer :total_leave
       
      t.timestamps null: false
    end
  end
end
