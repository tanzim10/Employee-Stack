require 'rails_helper'

RSpec.describe UserController, type: :controller do
  describe 'GET #new' do
    it 'assigns a new User to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user' do
        expect {
          post :create, params: {user: {email: 'tanzimfarhan@gmail.com', password: 'Tfra1024*', password_confirmation: 'Tfra1024*'} }
        }.to change(User, :count).by(1)
      end
  
      it 'redirects to the root path' do
        post :create, params: { user: {email: 'tanzimfarhan@gmail.com', password: 'Tfra1024*', password_confirmation: 'Tfra1024*'}}
        expect(response).to redirect_to(root_path)
      end
    end
  
    context 'with invalid attributes' do
      it 'does not create a new user' do
        expect {
          post :create, params: { user: { email: 'invalid_email', password: 'pwd', password_confirmation: 'pwd' } }
        }.not_to change(User, :count)
      end
  
      it 're-renders the new template' do
        post :create, params: { user: { email: 'invalid_email', password: 'pwd', password_confirmation: 'pwd' } }
        expect(response).to redirect_to(signup_path)  
      end
    end
  end
end
  