require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do

  describe 'POST #create' do
    before(:each) do
      request.env['devise.mapping'] = Devise.mappings[:user]
    end

    context 'when password is invalid' do
      it 'renders the page with error' do
        user = create(:user)

        post :create, session: { email: user.email, password: 'invalid' }

        expect(response).to render_template(:new)
        expect(flash[:alert]).to match(/^Invalid email or password/)
      end
    end

    context 'when password is valid' do
      it 'sets the user in the session and redirects them to their dashboard' do
        user = create(:user)

        post :create, session: { email: user.email, password: user.password }
        allow(controller).to receive(:current_user) { user }

        expect(response).to have_http_status(:success)
        expect(controller.current_user).to eq user
      end
    end
  end
end
