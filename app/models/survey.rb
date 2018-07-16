class Survey < ApplicationRecord
  validates_presence_of :color_id, :reaction_id
  belongs_to :color
  belongs_to :reaction
end