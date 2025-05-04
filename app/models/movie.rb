class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :add_title, presence: true, uniqueness: true
  before_destroy

  private
  def has_bookmark?
    unless self.bookmarks.size.positive?
      error.add(:base, "this movie are attached to bookmark")
      throw(:abort)
    end
  end
end
