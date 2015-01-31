require 'rails_helper'

describe UrlController, type: :controller do
  describe 'GET #show' do
    context 'with an existing url' do
      let(:url) { create :url, original_url: 'http://example.com' }
      it 'redirects to the original url' do
        get :show, id: url.key
        expect(response).to redirect_to 'http://example.com'
      end
      it 'increases the hits by one' do
        expect {
          get :show, id: url.key
          url.reload
        }.to change(url.hits, :count).by 1
      end
      context 'from ip \'12.34.56.78\'' do
        let(:ip) { '12.34.56.78' }
        it 'stores the ip in the url_hit object' do
          allow(request).to receive(:ip).and_return ip
          get :show, id: url.key
          expect(url.hits.last.ip).to eq ip
        end
      end
      context 'from referrer \'http://example.com/referrer\'' do
        let(:referrer) { 'http://example.com/referrer' }
        it 'stores the referrer in the url_hit object' do
          allow(request).to receive(:referrer).and_return referrer
          get :show, id: url.key
          expect(url.hits.last.referrer).to eq referrer
        end
      end

    end
    context 'with a non existing url' do
      it 'shows a 404 error' do
        get :show, id: 'non-existing-url'
        expect(response.code).to eq '404'
      end
      it 'does not create any hits' do
        expect {
          get :show, id: 'non-existing-url'
        }.to change(UrlHit, :count).by 0
      end
    end
  end

end
