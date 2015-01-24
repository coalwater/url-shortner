class Url < ActiveRecord::Base

  has_many :hits, class_name: UrlHit

  validates :key, presence: true
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: 'is invalid url format' }

  # Creates a hit record then returns the original url
  #
  # @return [String] The original_url for the url object
  def hit_and_return
    hits.create
    original_url
  end
end
