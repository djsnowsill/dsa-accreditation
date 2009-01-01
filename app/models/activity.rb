class Activity < ActiveRecord::Base
  has_many :completed_activities
  
  def long_description
    accreditation_type + " : " + reference_number + " : " + description
  end
  
end
