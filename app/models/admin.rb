class Admin < ApplicationRecord
  validates_presence_of :name, :password
  validates :screen_name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end