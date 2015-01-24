class Url < ActiveRecord::Base

  has_many :hits, class_name: UrlHit

  validates :key, presence: true
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: 'is invalid url format' }

  def hit_and_return
    hits.create
    original_url
  end
end
