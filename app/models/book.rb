class Book < ApplicationRecord

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  validates_presence_of :title, :pages, :year_pub, :cover_img

  # self.joins(:reviews).group(:id).average('reviews.rating') ## Keeping this for sorting later
  def average_rating
    reviews.average(:rating)
  end

  def total_reviews
    reviews.count
  end

  def self.find_titles
    self.select(:title).pluck(:title)
  end

end
