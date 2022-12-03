class Bookmark < ApplicationRecord
  belongs_to :post
  belongs_to :customer
  has_many :comments, dependent: :destroy
end
