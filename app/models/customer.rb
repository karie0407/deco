class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   def self.guest
   customer = Customer.find_or_create_by(email: "guest@example.com") do |customer|
   customer.name = "ゲスト"
   customer.password = SecureRandom.urlsafe_base64
   end
  end
end
