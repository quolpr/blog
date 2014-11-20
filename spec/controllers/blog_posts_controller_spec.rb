require 'rails_helper'

describe BlogPostsController, :type => :controller do


  describe "GET 'index'" do
    it 'should render template' do
      get :index
      expect(response).to render_template :index
    end

    it 'should get only necessary data' do
      blog_posts = FactoryGirl.create_list(:blog_post_with_tags, 20)
      get :index, offset:5, limit:4
      expect(assigns(:blog_posts)).to eq blog_posts[5..8]
    end
  end

  describe "PUT 'update'" do
    def update_post(id, name)
      put(:update, id: id, blog_post: {name: name})
    end

    it_behaves_like 'user not authed' do
      let(:make_request){update_post 1, 'test'}
    end

    context 'user is authed' do
      before :each do
        session[:admin] = true
      end

      context 'good data' do
        it 'should update post and return success response' do
          post = FactoryGirl.create(:blog_post_with_tags)

          expect {update_post(post.id, 'neww post')}.to change{BlogPost.find(post.id).name}.from(post.name).to('neww post')
          expect(response).to be_success
          expect(response).not_to render_template :update
        end

      end

      context 'not valid data' do
        it 'should render all validation errors' do
          post = FactoryGirl.create(:blog_post_with_tags)
          expect{update_post post.id, 'n'}.to_not change{BlogPost.find(post.id)}
          expect(response).to have_status(400)
          expect(assigns(:blog_post)).to eq post
        end

        context 'bad id' do
          it 'should return 404 response' do
            update_post 1000, 'newww post'
            expect(response).to have_status(404)
            expect(response).not_to render_template :update
          end
        end
      end
    end

  end

  describe "DELETE 'destroy'" do
    it_behaves_like 'user not authed' do
      let(:make_request){delete :destroy, id: 2}
    end
    context 'user is authed' do
      before :each do
        session[:admin] = true
      end

      context 'id is valid' do
        it 'delete record' do
          post = FactoryGirl.create(:blog_post_with_tags)
          expect{delete :destroy, id:post.id}.to change{BlogPost.count}.by(-1)
          expect(response).to have_status 200
        end
      end

      context 'id is not valid' do
        it 'should return 404 error' do
          expect{delete :destroy, id: 1000}.not_to change{BlogPost.count}
          expect(response).to have_status 404
        end
      end
    end

  end

  describe "GET 'show'" do
    context 'bad id' do
      it 'return 404 error' do
        get :show, id: 1000
        expect(response).to have_status(404)
      end
    end

    context 'good id' do
      it 'return http success' do
        post = FactoryGirl.create(:blog_post_with_tags)
        get :show, id: post.id
        expect(response).to be_success
        expect(assigns(:blog_post)).to eq post
      end
    end

  end

  describe "POST 'create'" do
    it_behaves_like 'user not authed' do
      let(:make_request){post :create}
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
