class Shop < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :admin
  has_one_attached :image

  def self.looks(search, word)
    if search == "perfect_match"
      @shop = Shop.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @shop = Shop.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @shop = Shop.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @shop = Shop.where("name LIKE?","%#{word}%")
    else
      @shop = Shop.all
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-ramen-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
