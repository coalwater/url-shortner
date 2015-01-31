# A url represents a single shortened url, each
# url has a +key+ which stores the stores the short code
# that maps to the +original_url+
class Url < ActiveRecord::Base

  has_many :hits, class_name: UrlHit

  validates :key, presence: true
  validates :original_url, presence: true, format: { with: URI::regexp(%w(http https)), message: 'is invalid url format' }

  # Creates a hit record then returns the original url
  #
  # @param args [Hash] a has of options
  # @option args [String] :ip The ip the request originated from
  # @return [String] The original_url for the url object
  def hit_and_return(**args)
    ip = args.fetch :ip, nil
    referrer = args.fetch :referrer, nil
    hits.create(ip: ip, referrer: referrer)
    original_url
  end
end
