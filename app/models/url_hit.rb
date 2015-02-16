# A UrlHit represents one hit on a Url object, it was created as a
# separate object because further attributes are going to be added
# on each record in the future, currently it only counts hits
# without any extra data
class UrlHit < ActiveRecord::Base
  belongs_to :url

  delegate :key, to: :url, prefix: true
  delegate :original_url, to: :url
end
