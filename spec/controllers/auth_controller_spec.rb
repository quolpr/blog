require 'rails_helper'

RSpec.describe AuthController, :unit, :type => :controller do

  describe "POST 'create'" do

    context 'auth data valid' do
      before{post :create, username: 'test', password: 'test'}
      it { should respond_with(:success) }
      it { should set_session[:admin].to(true) }
    end

    context 'auth data not valid' do
      before{post :create, username: 'tet', password: 'test'}
      it { should respond_with(401) }
      it { should set_session[:admin].to(false) }
    end
  end

  describe "DELETE 'destroy'" do
    before {post :destroy}

    it { should respond_with(200) }
    it { should set_session[:admin].to(false) }
  end

end
