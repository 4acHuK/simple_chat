class User < ApplicationRecord
  acts_as_authentic
  has_friendship

  has_many :messages, dependent: :destroy

  scope :all_except, ->(user) { where.not(id: user) }

  def room_for(partner_id)
    token = [id, partner_id.to_i].sort.join
    Room.where(token: token).first_or_create
  end
end