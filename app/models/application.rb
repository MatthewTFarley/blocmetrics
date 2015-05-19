class Application < ActiveRecord::Base
  belongs_to :user

  validates :name, length: { minimum: 2 }, presence: true
  validates :url, presence: true
end
