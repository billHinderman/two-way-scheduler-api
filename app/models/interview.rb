class Interview < ApplicationRecord
  before_create :set_key
  before_create :initialize_status

  belongs_to :requesting_employer, class_name: "User"
  belongs_to :requesting_talent, class_name: "User"

  enum status: [
    :pending,
    :approved,
    :active,
    :expired,
    :denied
  ]

  private
  def set_key
    self.key = SecureRandom.urlsafe_base64(12)
    rescue ActiveRecord::RecordNotUnique
      retry
  end

  def initialize_status
    self.status = "pending"
  end
end
