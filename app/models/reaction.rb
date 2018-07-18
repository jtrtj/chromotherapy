class Reaction < ApplicationRecord
  validates_presence_of :definition, :user_id
  validates :word, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :user
  has_many :surveys
  has_many :colors, through: :surveys
end