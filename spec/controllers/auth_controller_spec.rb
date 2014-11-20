require 'rails_helper'

RSpec.describe AuthController, :type => :controller do

  describe "POST 'create'" do
    let(:authorizer){double(Authorizer)}

    before(:each) {controller.authorizer = authorizer}

    it 'check if user is admin' do
      expect(authorizer).to receive(:admin?).with('manyrus', '111111')
      post :create, username: 'manyrus', password: '111111'
    end

    context 'auth data valid' do
      let(:authorizer){double(Authorizer, admin?: true)}
      before{post :create}
      it { should respond_with(:success) }
      it { should set_session(:admin).to(true) }
    end

    context 'auth data not valid' do
      let(:authorizer){double(Authorizer, admin?: false)}
      before{post :create}
      it { should respond_with(401) }
      it { should set_session(:admin).to(false) }
    end
  end

  describe "DELETE 'destroy'" do
    before{post :destroy}

    it { should respond_with(200) }

    it { should set_session(:admin).to(false) }

  end

end
