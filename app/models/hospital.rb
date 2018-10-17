class Hospital < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates_presence_of :name
end
