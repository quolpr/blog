require 'rails_helper'

module Blog
  class RecordNotFound < ActiveRecord::RecordNotFound
    def initialize

    end
  end
end
describe BlogPostsController, :type => :controller do

  describe "GET 'index'" do
    def mock_select(limit:, offset:)
      expect(BlogPost).to receive(:limit).with(limit).and_return(off = double)
      expect(off).to receive(:offset).with(offset)
    end

    it "select BlogPost's by offset and limit" do
      mock_select(limit:10, offset:20)
      get :index, limit:10, offset:20
    end

    it "select BlogPost's by default" do
      get :index, limit:10, offset:0
    end

    context 'all good' do
      before {allow(BlogPost).to receive_message_chain(:limit, :offset)}
      before {get :index}

      it { should render_template('index') }
    end
  end

  describe "PUT 'update'" do
    before(:each) {session[:admin] = true}
    let(:stub_request){put :update, id:'10', blog_post:{name:'test'}}

    it 'find post by id' do
      expect(BlogPost).to receive(:find).with('10').and_return(spy)
      stub_request
    end

    context 'post was not found' do
      before{allow(BlogPost).to receive(:find)
                                    .and_raise(ActiveRecord::RecordNotFound)}
      before{stub_request}
      it { should respond_with(404) }
    end

    it 'update attributes' do
      allow(BlogPost).to receive(:find).and_return(post = double)
      expect(post).to receive(:update_attributes!).with({name: 'test'})
      stub_request
    end

    context 'not valid data' do
      before do
        allow(BlogPost).to receive_message_chain('find.update_attributes!')
                               .and_raise(Blog::RecordNotFound)
      end
      before {stub_request}
      it { should respond_with(404) }
    end

    context 'all good' do
      before {allow(BlogPost).to receive_message_chain('find.update_attributes!')}
      before {stub_request}

      it { should respond_with(200) }
    end

    it_behaves_like 'user not authed'
  end

  describe "DELETE 'destroy'" do
    before(:each) {session[:admin] = true}
    let(:stub_request){delete :destroy, id:'10'}

    it 'find blog post' do
      expect(BlogPost).to receive(:find).with('10').and_return(spy)
      stub_request
    end

    context 'blog not found' do
      before do
        allow(BlogPost).to receive_message_chain('find.destroy')
                               .and_raise(Blog::RecordNotFound)
      end

      before {stub_request}

      it { should respond_with(404) }
    end

    it 'destroy post' do
      allow(BlogPost).to receive(:find).and_return(off = double)
      expect(off).to receive(:destroy)
      stub_request
    end

    context 'all good' do
      before {allow(BlogPost).to receive_message_chain('find.destroy')}
      before {stub_request}

      it { should respond_with(200) }
    end

    it_behaves_like 'user not authed'

  end

  describe "GET 'show'" do
    let(:stub_request){get :show, id:'10'}

    it 'find post' do
      expect(BlogPost).to receive(:find).with('10')
      stub_request
    end

    context 'not found' do
      before do
        allow(BlogPost).to receive(:find).and_raise(Blog::RecordNotFound)
      end
      before {stub_request}
      it { should respond_with(404) }
    end

    context 'all good' do
      before {allow(BlogPost).to receive(:find)}
      before {stub_request}

      it { should render_template('show') }
    end
  end

  describe "POST 'create'" do
    let(:stub_request){post :create, blog_post: {name: 'rr', post:'ff', tags_attributes:[{name: 'ds'}]}}
    before(:each) {session[:admin] = true}
    it_behaves_like 'user not authed'
    
    context 'not valida data' do
      before{
        expect(BlogPost).to receive(:create!).and_raise()
      }
    end
    context 'authed' do
      before :each do
        session[:admin] = true
      end

      def make_request(post_type, status)
        blog_post = FactoryGirl.build(post_type, tags_count: 1)
        post :create, blog_post: {name: blog_post.name, post: blog_post.post, tags_attributes:[{name: blog_post.tags[0].name}]}
        expect(response).to have_status status
        blog_post
      end

      context 'good data' do
        it 'return success and blog post id' do
          blog_post = make_request :blog_post_with_tags, 200
          expected_post = assigns(:blog_post)
          expect(expected_post.name).to eq blog_post.name
          expect(expected_post.tags.count).to eq 1#blog_post.tags.count not working(???)
        end
      end

      context 'bad data' do
        it 'return validation errors' do
          make_request :bad_blog_post, 400
        end
      end
    end
  end

end
