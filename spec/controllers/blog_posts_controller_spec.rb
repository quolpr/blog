require 'rails_helper'


describe BlogPostsController, :unit, :type => :controller do
  let(:blog_post) {FactoryGirl.create :blog_post_with_tags}
  let(:another_blog_post) {FactoryGirl.create :blog_post_with_tags}

  
  describe "GET 'index'" do
    def create_posts(count)
      FactoryGirl.create_list :blog_post_with_tags, count
    end

    it "select BlogPost's by limit" do
      create_posts 2
      get :index, limit: 1, offset: 0
      expect(assigns(:blog_posts).count).to eq 1
    end

    it "select BlogPost's by offset" do
      create_posts 2
      get :index, limit: 1, offset: 2
      expect(assigns(:blog_posts).count).to eq 0
    end

    context 'params not set' do

      it 'use default params for limit' do
        create_posts 11
        get :index
        expect(assigns(:blog_posts).count).to eq 10
      end

      it 'use default params for offset' do
        create_posts 1
        get :index
        expect(assigns(:blog_posts).count).to eq 1
      end
    end

    it {get :index; should render_template('index') }
    it {get :index; should respond_with(200) }
  end

  describe "PUT 'update'" do
    before(:each) {session[:admin] = true}
    def make_request(id=blog_post.id)
      put :update, id: id, blog_post: { title: 'new_tittle' }
    end

    before{make_request}

    it 'update record' do
      blog_post.reload
      expect(blog_post.title).to eq 'new_tittle'
    end

    it { should respond_with(200) }
    

    context 'not found' do
      it 'return 404 error' do
        make_request(blog_post.id+1)
        expect(response.status).to eq 404
      end
    end

    it_behaves_like 'user not authed'
  end

  describe "DELETE 'destroy'" do
    before(:each) {session[:admin] = true}

    def make_request(id=blog_post.id)
      delete :destroy, id: id
    end

    it 'delete record' do
      blog_post
      expect{make_request}.to change(BlogPost,:count).by(-1)
    end

    it { make_request; should respond_with(200) }
    
    context 'record not found' do
      it 'return 404 error' do
        make_request(blog_post.id+1)
        expect(response.status).to eq 404
      end
    end

    it_behaves_like 'user not authed'
  end

  describe "GET 'show'" do
    def make_request(id=blog_post.id)
      get :show, id:id
    end

    it 'find post' do
      make_request
      expect(assigns(:blog_post)).to eq blog_post
    end

    it {make_request; should render_template('show') }

    context 'record not found' do
      it 'return 404 error' do
        make_request(blog_post.id+1)
        expect(response.status).to eq 404
      end
    end
  end

  describe "POST 'create'" do
    before(:each) {session[:admin] = true}
    def make_request
      params =  FactoryGirl.attributes_for(:blog_post)
      params[:all_tags] = [{name: 'test'}]
      post :create, blog_post: params
    end

    it 'creates new post' do
      expect{make_request}.to change(BlogPost,:count).by(1)
    end

    it {make_request;should respond_with(200)}

    context 'data not valid' do
      before{post :create, blog_post:{title: 't'}}
      it {should respond_with(400)}
      it {should render_template('create')}
    end

    it_behaves_like 'user not authed'
  end

end
