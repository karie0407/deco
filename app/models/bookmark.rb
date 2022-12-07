class Bookmark < ApplicationRecord
  belongs_to :post_image
  belongs_to :customer
end
