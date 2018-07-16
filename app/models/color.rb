class Color < ApplicationRecord
  validates_presence_of :name, :admin_id
  validates :hex_value, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :admin
  has_many :surveys
  has_many :reactions, through: :surveys
end
