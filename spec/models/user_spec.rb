require 'rails_helper'

describe User, type: :model do
    describe 'validations' do
      it 'is invalid without an email' do
        expect(build :user, email: nil).not_to be_valid
      end
      it 'is invalid without a password' do
        expect(build :user, password: nil).not_to be_valid
      end
    end

end
