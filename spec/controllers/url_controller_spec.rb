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
