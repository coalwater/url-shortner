require 'rails_helper'

describe UrlController, type: :controller do
  describe 'GET #show' do
    context 'with an existing url' do
      before :each do
        @url = create :url, original_url: 'http://example.com'
      end
      it 'redirects to the original url' do
        get :show, id: @url.key
        expect(response).to redirect_to 'http://example.com'
      end
    end
    context 'with a non existing url' do
      it 'shows a 404 error' do
        get :show, id: 'non-existing-url'
        expect(response.code).to eq '404'
      end
    end
  end

end
