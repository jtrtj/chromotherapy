class Admin < ApplicationRecord
  validates_presence_of :name, :password
  validates :screen_name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :colors
  has_many :reactions
  
  def self.authenticate(screen_name, password)
    # if email and password correspond to a valid user, return that user
    if Admin.where(screen_name: screen_name, password: password).first
      Admin.where(screen_name: screen_name, password: password).first
    else 
      nil
    end
  end
end