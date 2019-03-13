class User < ApplicationRecord
  has_many :comments
  has_many :interactives
  has_many :home
  has_many :bookinghome
  before_save :downcase_email, :downcase_account_name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  SIGNUP_PARAMS =
    %i(name account_name email password password_confirmation).freeze

  validates :name, presence: true, length: {maximum: Settings.max_length_name}
  validates :account_name, presence: true,
    length: {maximum: Settings.max_length_account_name},
    uniqueness: {case_sensitive: false}
  validates :email, presence: true,
    length: {maximum: Settings.max_length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    allow_nil: true,
    length: {minimum: Settings.min_length_password}
  has_secure_password

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
                BCrypt::Engine::MIN_COST
              else
                BCrypt::Engine.cost
              end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  private

  def downcase_email
    email.downcase!
  end

  def downcase_account_name
    account_name.downcase!
  end
end
