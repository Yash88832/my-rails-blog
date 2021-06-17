class Post < ApplicationRecord

  STATUS_DRAFT = "Draft"
  STATUS_PUBLISHED = "Published"
  STATUS_ARCHIVED = "Archived"
  # => Associations
  belongs_to :user, optional:true
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, :body, :snippet, :status, presence: true
  before_save :set_published_date

  private

  def set_published_date
    if !self.published_date && [STATUS_PUBLISHED].include?(status)
      self.published_date = Time.now
    end
  end
end
