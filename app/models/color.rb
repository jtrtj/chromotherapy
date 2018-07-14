class Color < ApplicationRecord
  validates_presence_of :name, :admin_id
  validates :hex_value, presence: true, uniqueness: { case_sensitive: false }
end