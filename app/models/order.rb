class Order < ApplicationRecord
  after_create :order_send
  
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def order_send
    UserMailer.order_email(user).deliver_now
  end
end
