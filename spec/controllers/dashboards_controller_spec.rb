require 'rails_helper'

describe DashboardsController, type: :controller do
  let!(:user) { create :user }

  describe '#hompage' do
    context 'non logged in user' do
      it 'redirects to the login page' do
        get :homepage
        expect(response).to redirect_to new_user_session_path
      end
    end
    context 'logged in user' do
      before :each do
        sign_in user
      end
      describe 'don\'t know what it should show yet'
    end
  end


  describe '#show' do
    context 'non logged in user' do
      it 'redirects to login page' do
        get :homepage
        expect(response).to redirect_to new_user_session_path
      end
    end
    context 'logged in user' do
      before :each do
        sign_in user
      end
      it 'renders the show template' do
        get :show
        expect(response).to render_template :show
      end
      it 'returns the counts of urls and url_hits' do
        get :show
        expect(assigns[:urls_count]).not_to be_nil
        expect(assigns[:hits_count]).not_to be_nil
      end
    end
  end


  describe '#urls' do
    context 'non logged in user' do
      it 'redirects to login page' do
        get :urls
        expect(response).to redirect_to new_user_session_path
      end
    end
    context 'logged in user' do
      before :each do
        sign_in user
      end
      it 'renders the urls template' do
        get :urls
        expect(response).to render_template :urls
      end
      it 'returns all urls to the view' do
        urls = 5.times.inject([]) { |total| total << create(:url) }
        get :urls
        expect(assigns[:urls]).to eq urls
      end
    end
  end


  describe '#hits' do
    context 'non logged in user' do
      it 'redirects to login page' do
        get :hits
        expect(response).to redirect_to new_user_session_path
      end
    end
    context 'logged in user' do
      before :each do
        sign_in user
      end
      it 'renders the hits template' do
        get :hits
        expect(response).to render_template :hits
      end
      it 'returns all the hits to the view' do
        urls = 5.times.inject([]) { |total| total << create(:url) }
        hits = []
        urls.each { |url| 2.times { hits << create(:url_hit, url: url) } }
        get :hits
        expect(assigns[:hits]).to eq hits
      end
    end
  end

end
