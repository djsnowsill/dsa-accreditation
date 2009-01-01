class Member < ActiveRecord::Base
  has_many :completed_activities
  
  def current_cpd_points
    0
  end
  
  def self.search(search, page)
    if search
      paginate :conditions => ['last_name LIKE ?', "#{search}%"], :page => page, :order => 'last_name, first_name'
    else
      paginate :page => page, :order => 'last_name, first_name'
    end
  end
  
end
