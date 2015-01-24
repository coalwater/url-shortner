class Url < ActiveRecord::Base
  validates :key, presence: true
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: 'is invalid url format' }
end
