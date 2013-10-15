class Board < ActiveRecord::Base
  attr_accessible :description
belongs_to :user
  has_many :pins, through: :pinnings
accepts_nested_attributes_for :pins

  validates :user_id, presence: true
end