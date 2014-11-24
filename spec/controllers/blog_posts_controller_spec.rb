require 'rails_helper'


describe BlogPostsController, :unit, :type => :controller do

  describe "GET 'index'" do
    let(:params) {{'limit' => '13', 'offset' => '2'}}
    let(:make_request) {get :index, params}

    let(:model) {expect(BlogPost).to receive(:limit).and_return(s = spy); s}

    it "select BlogPost's by limit" do
      expect(BlogPost).to receive(:limit).with(13).and_return(spy)
      make_request
    end
    
    it "select BlogPost's by offset" do
      expect(model).to receive(:offset).with(2)
      make_request
    end

    it "select BlogPost's by order" do
      expect(model).to receive(:order).with('id DESC')
      make_request
    end

    context 'params not set' do
      after{get :index}
      it 'use default params for limit' do
        expect(BlogPost).to receive(:limit).with(10).and_return(spy)
      end

      it 'use default params for offset' do
        expect(model).to receive(:offset).with(0)
      end
    end

    context 'response' do
      before do
        allow(BlogPost).to receive_message_chain('limit.offset.order')
        make_request
      end

      it { should render_template('index') }
      it { should respond_with(200) }
    end
  end

  describe "PUT 'update'" do
    before(:each) {session[:admin] = true}
    let(:params){{'id' => '10', 'blog_post' => {'title' => 'test'}}}
    let(:make_request){put :update, params}

    it 'find post by id' do
      expect(BlogPost).to receive(:find).with(params['id']).and_return(spy)
      make_request
    end

    it 'update attributes' do
      expect(BlogPost).to receive_message_chain('find.update_attributes!').with(params['blog_post'])
      make_request
    end

    context 'response' do
      before do
        allow(BlogPost).to receive_message_chain('find.update_attributes!')
        make_request
      end

      it { should respond_with(200) }
    end

    it_behaves_like 'user not authed'
    it_behaves_like 'not found' do
      let(:mock_model) {allow(BlogPost).to receive(:find).and_raise(BlogTest::RecordNotFound)}
    end
    it_behaves_like 'not valid data' do
      let(:mock_model) {allow(BlogPost).to receive(:find).and_raise(BlogTest::RecordInvalid)}
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) {session[:admin] = true}
    let(:params){{'id' => '10'}}
    let(:make_request){delete :destroy, params}

    it 'find blog post' do
      expect(BlogPost).to receive(:find).with('10').and_return(spy)
      make_request
    end

    it 'destroy post' do
      expect(BlogPost).to receive_message_chain('find.destroy')
      make_request
    end

    context 'response' do
      before do
        allow(BlogPost).to receive_message_chain('find.destroy')
        make_request
      end

      it { should respond_with(200) }
    end

    it_behaves_like 'user not authed'
    it_behaves_like 'not found' do
      let(:mock_model) {allow(BlogPost).to receive(:find).and_raise(BlogTest::RecordNotFound)}
    end
  end

  describe "GET 'show'" do
    let(:params) {{id:'10'}}
    let(:make_request){get :show, params}

    it 'find post' do
      expect(BlogPost).to receive(:find).with('10')
      make_request
    end

    context 'response' do
      before do 
        allow(BlogPost).to receive(:find)
        make_request
      end

      it { should render_template('show') }
    end

    it_behaves_like 'not found' do
      let(:mock_model) {allow(BlogPost).to receive(:find).and_raise(BlogTest::RecordNotFound)}
    end
  end

  describe "POST 'create'" do
    let(:params){{blog_post: {'title' => 'rr', 'post' => 'ff', 'tags_attributes' => [{'name' => 'ds', 'path' => 'test'}]}}}
    let(:make_request){post :create, params}

    before(:each) {session[:admin] = true}

    it 'creates new post' do
      expect(BlogPost).to receive(:create!).with(params[:blog_post])
      make_request
    end

    context 'response' do
      before do 
        allow(BlogPost).to receive(:create!)
        make_request
      end

      it {should respond_with(200)}
      it {should render_template('create')}
    end
    

    it_behaves_like 'user not authed'
    it_behaves_like 'not valid data' do
      let(:mock_model){allow(BlogPost).to receive(:create!).and_raise(BlogTest::RecordInvalid)}
    end
  end

end
