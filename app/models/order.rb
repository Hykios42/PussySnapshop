class Order < ApplicationRecord
  after_create :order_send
  belongs_to :user
  belongs_to :item

  def order_send
    UserMailer.order_email(user).deliver_now
  end
end
