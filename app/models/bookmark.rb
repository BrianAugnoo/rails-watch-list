class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie_id, uniqueness: { scope: :list_id, message: "has already been added to this list" }, presence: true
  validates :list_id, uniqueness: { scope: :movie_id, message: "has already been added" }, presence: true
  validate :has_long_enough

  private

  def has_long_enough
    if comment.blank? || comment.length < 6
      errors.add(:comment, "must be at least 6 characters long")
    end
  end
end
