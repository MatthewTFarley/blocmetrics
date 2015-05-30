class Application < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user
  validates :name, length: { minimum: 2 }, presence: true
  validates_uniqueness_of :name
  validates :url, presence: true
  validates_uniqueness_of :url
end
