class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }

  validate :clickbait

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

  def clickbait
    unless CLICKBAIT.any? { |p| p.match(title) }
      errors.add(:title, "Title must be clickbait")
    end
  end

end
