# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081226104435) do

  create_table "activities", :force => true do |t|
    t.string   "reference_number"
    t.string   "activity_type"
    t.string   "activity_level"
    t.string   "description"
    t.integer  "units"
    t.integer  "max_units_per_year"
    t.boolean  "mandatory"
    t.string   "accreditation_type"
    t.boolean  "bonus"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_activities", :force => true do |t|
    t.integer  "member_id"
    t.integer  "activity_id"
    t.date     "completed_on"
    t.string   "description"
    t.integer  "units"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "member_number"
    t.string   "title"
    t.string   "first_name"
    t.string   "initial"
    t.string   "other_names"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "suburb"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "email_address"
    t.string   "business"
    t.string   "direct_phone"
    t.string   "private_phone"
    t.string   "mobile_phone"
    t.string   "facsimile"
    t.string   "emergency_contact_person"
    t.string   "emergency_contact_number"
    t.string   "gender"
    t.string   "occupation"
    t.string   "user_name"
    t.string   "password"
    t.string   "directory"
    t.string   "mailing_list"
    t.string   "financial_date"
    t.string   "status"
    t.string   "member_type"
    t.string   "subscription"
    t.string   "state_code"
    t.string   "judge_level_standard"
    t.string   "judge_level_latin_american"
    t.string   "judge_level_new_vogue"
    t.string   "date_of_birth"
    t.string   "judge_professional_events"
    t.string   "scrutineer"
    t.string   "coach_level_standard"
    t.string   "coach_level_latin_american"
    t.string   "coach_level_new_vogue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
