require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'is invalid without a key' do
    expect(build :url, key: nil).not_to be_valid
  end
  it 'is invalid without an original url' do
    expect(build :url, original_url: nil).not_to be_valid
  end
end
