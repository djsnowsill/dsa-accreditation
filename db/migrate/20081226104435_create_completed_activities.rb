class CreateCompletedActivities < ActiveRecord::Migration
  def self.up
    create_table :completed_activities do |t|
      t.integer :member_id
      t.integer :activity_id
      t.date :completed_on
      t.string  :description
      t.integer :units
      t.timestamps
    end
  end

  def self.down
    drop_table :completed_activities
  end
end
