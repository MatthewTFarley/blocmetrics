class Event < ActiveRecord::Base
  belongs_to :application

  validates_presence_of :application
  validates_presence_of :name
  validates_uniqueness_of :name
end
