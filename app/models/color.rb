class Color < ApplicationRecord
  validates_presence_of :name, :user_id
  validates :hex_value, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_many :surveys
  has_many :reactions, through: :surveys
end
