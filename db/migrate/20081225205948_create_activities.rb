require 'fastercsv'

class CreateActivities < ActiveRecord::Migration
  
  def self.up
    
    create_table :activities do |t|
      t.string :reference_number
      t.string :activity_type
      t.string :activity_level
      t.string :description
      t.integer :units
      t.integer :max_units_per_year
      t.boolean :mandatory
      t.string :accreditation_type
      t.boolean :bonus
      
      t.timestamps
    end
    
    FasterCSV.foreach("db/data/activities.csv",:headers=>true) do |row|
        Activity.create(:accreditation_type=>row[0], :reference_number=>row[1], :activity_level=>row[2], :description=>row[3], 
        :units=>row[4], :max_units_per_year=>row[5], :activity_type=>row[6], :mandatory=>row[7], :bonus=>row[8])
    end  
  
  end

  def self.down
    Activity.delete_all
    
    drop_table :activities
  end
end
