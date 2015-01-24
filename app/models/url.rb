class Url < ActiveRecord::Base
  validates :key, presence: true
  validates :original_url, presence: true
end
