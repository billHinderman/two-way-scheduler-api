class User < ActiveRecord::Base
  extend Devise::Models
  before_create :set_key
  after_create :create_calendar

  has_many :interviews
  has_many :appointments, through: :interviews
  has_one :calendar

  # Include default devise modules.
  DEVISE_ATTRIBUTES = [
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  ].freeze
  devise *DEVISE_ATTRIBUTES
  include DeviseTokenAuth::Concerns::User

  enum role: [
    :employer,
    :talent
  ]
  # 
  # def token_validation_response
  #  self_response
  # end

  def self_response
   UserSerializerSelf.new( self, root: false )
  end

  private
  def set_key
    self.key = SecureRandom.urlsafe_base64(12)
    rescue ActiveRecord::RecordNotUnique
      retry
  end
end
