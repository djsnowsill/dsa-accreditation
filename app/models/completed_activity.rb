class CompletedActivity < ActiveRecord::Base
  belongs_to :member
  belongs_to :activity
  
  validates_presence_of :activity
  validates_presence_of :completed_on
  validates_presence_of :units
  validates_numericality_of :units
  
  
  def activity_reference_number
    activity.reference_number if activity
  end
  
  def activity_reference_number=(reference_number)
    self.activity = Activity.find_by_reference_number(reference_number) unless reference_number.blank?
  end
  
end
