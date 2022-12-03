class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
   def self.guest
   customer = Customer.find_or_create_by(email: "guest@example.com") do |customer|
   customer.name = "ゲスト"
   customer.password = SecureRandom.urlsafe_base64
   end
  end
end
