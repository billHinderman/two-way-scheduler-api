# frozen_string_literal: true

class User < ActiveRecord::Base
  before_create :set_key

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

  def token_validation_response
   self_response
  end

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
