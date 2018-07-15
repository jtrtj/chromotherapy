class Reaction < ApplicationRecord
  validates_presence_of :definition, :admin_id
  validates :word, presence: true, uniqueness: { case_sensitive: false }

  belongs_to :admin
  has_many :sessions
  has_many :colors, through: :sessions
end