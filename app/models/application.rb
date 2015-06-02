class Application < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  validates_presence_of :user
  validates :name, length: { minimum: 2 }, presence: true
  validates_uniqueness_of :name
  validates :url, presence: true
  validates_uniqueness_of :url
end
