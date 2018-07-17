class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :name, require: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: ['default', 'admin']

  has_many :colors
  has_many :reactions
end