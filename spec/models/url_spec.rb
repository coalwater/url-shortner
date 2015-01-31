require 'rails_helper'

describe Url, type: :model do
  it 'is invalid without a key' do
    expect(build :url, key: nil).not_to be_valid
  end
  it 'is invalid without an original url' do
    expect(build :url, original_url: nil).not_to be_valid
  end
  describe '#hit_and_return' do
    let(:url) { create :url }
    context 'without an ip' do
      it 'creates a hit record' do
        expect{
          url.hit_and_return
        }.to change(UrlHit, :count).by 1
      end
      it 'doesn\'t save an ip' do
        url.hit_and_return
        expect(url.hits.last.ip).to be_nil
      end
    end
    context 'with an ip' do
      it 'saves the ip' do
        url = create :url
        ip = '12.34.56.78'
        url.hit_and_return(ip: ip)
        expect(url.hits.last.ip).to eq ip
      end
    end
    context 'with a referrer link' do
      it 'saves the referrer link' do
        url = create :url
        referrer = 'http://example.com/referrer'
        url.hit_and_return(referrer: referrer)
        expect(url.hits.last.referrer).to eq referrer
      end
    end
    context 'wihtout a referrer link' do
      it 'saves a url_hit record' do
        expect{
          url.hit_and_return
        }.to change(UrlHit, :count).by 1
      end
      it 'doesn\'t save any referrer' do
        url.hit_and_return
        expect(url.hits.last.referrer).to be_nil
      end
    end
  end
end
