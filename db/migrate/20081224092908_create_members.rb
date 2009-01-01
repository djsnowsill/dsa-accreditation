class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :member_number
      t.string :title
      t.string :first_name
      t.string :initial
      t.string :other_names
      t.string :last_name
      t.string :company_name
      t.string :address1
      t.string :address2
      t.string :suburb 
      t.string :state
      t.string :postcode
      t.string :country
      t.string :email_address
      t.string :business
      t.string :direct_phone
      t.string :private_phone
      t.string :mobile_phone
      t.string :facsimile
      t.string :emergency_contact_person
      t.string :emergency_contact_number
      t.string :gender
      t.string :occupation
      t.string :user_name
      t.string :password
      t.string :directory
      t.string :mailing_list
      t.string :financial_date
      t.string :status
      t.string :member_type
      t.string :subscription
      t.string :state
      t.string :state_code
      t.string :judge_level_standard
      t.string :judge_level_latin_american
      t.string :judge_level_new_vogue
      t.string :date_of_birth
      t.string :judge_professional_events
      t.string :scrutineer
      t.string :coach_level_standard
      t.string :coach_level_latin_american
      t.string :coach_level_new_vogue

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
