class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses, dependent: :destroy
  has_one_attached :icon

  validates :name, presence: true
end
