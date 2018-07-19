class Color < ApplicationRecord
  validates_presence_of :name, :user_id
  validates :hex_value, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_many :surveys, dependent: :destroy
  has_many :reactions, through: :surveys

  def self.pick_two
    Color.order('RANDOM()').limit(2)
  end
end
