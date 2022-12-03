class PostImage < ApplicationRecord
  belongs_to :customer
  has_many :bookmarks, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :image

  def self.looks(searches, words)
    if searches == "perfect_match"
      @post_image = PostImage.where("name LIKE ?", "#{words}")
    else
      @post_image = PostImage.where("name LIKE ?", "%#{words}%")
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
