class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expences, dependent: :destroy

  validates :name, presence: true
end

