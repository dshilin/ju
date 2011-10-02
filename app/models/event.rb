class Event < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "200x200>" }
  validates_presence_of :actual_time, :name
end
