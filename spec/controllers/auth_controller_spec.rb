require 'rails_helper'

RSpec.describe AuthController, :type => :controller do

  describe "POST 'create'" do
    def make_request(is_authed, status)
      expect_any_instance_of(Authorizer).to receive(:admin?).once.with('manyrus', '111111').and_return(is_authed)
      post :create, username: 'manyrus', password: '111111'
      expect(session[:admin]).to eq is_authed
      expect(response).to have_status status
    end

    context 'good auth data' do
      it 'auth user' do
        make_request true, 200
      end
    end

    context 'bad auth data' do
      it 'not auth user' do
        make_request false, 401
      end
    end
  end

  describe "DELETE 'destroy'" do
    it 'change session admin to false' do
      session[:admin] = true
      expect{delete :destroy}.to change{session[:admin]}.from(true).to(false)
    end
  end

end
