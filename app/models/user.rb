class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy

  has_many :comments, dependent: :destroy
  
  validates :username, presence: true, uniqueness: true
  validates :phone_number, presence: true, format: { with: /\A\+1\d{10}\z/, message: "must be a valid US phone number" }

  after_create :send_welcome_sms

  private

  def send_welcome_sms
    SmsNotifier.new(to: self.phone_number, body: "Welcome #{self.username}! Thank you for registering.").send_sms
  end
end
