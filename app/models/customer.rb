class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_images, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
   def self.guest
   customer = Customer.find_or_create_by(email: "guest@example.com") do |customer|
   customer.name = "ゲスト"
   customer.password = SecureRandom.urlsafe_base64
   end
   end
   def self.looks(searches, words)
     if searches == "perfect_match"
     @customer = Customer.where("name LIKE ?","#{words}")
     else
      @customer = Customer.where("name LIKE ?","%#{words}#")
     end
   end
end
