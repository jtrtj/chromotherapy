class Survey < ApplicationRecord
  validates_presence_of :color_id, :reaction_id, :user_id
  belongs_to :color
  belongs_to :reaction
  belongs_to :user

  def self.sort_by_color(color)
    where(color: color)
  end

  def self.sort_by_reaction(reaction)
    where(reaction: reaction)
  end
end