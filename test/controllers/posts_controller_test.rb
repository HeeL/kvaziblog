require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  describe "index" do

    it "shows the latest posts first" do
      posts = [
        FactoryGirl.create(:post, created_at: 1.day.ago),
        FactoryGirl.create(:post)
      ]

      get :index
      assert_response :success

      posts.last.must_equal assigns(:posts).first
      posts.first.must_equal assigns(:posts).last
    end

    it "paginates posts" do
      FactoryGirl.create_list(:post, PostsController::PER_PAGE + 1)
      get :index

      assigns(:posts).count.must_equal PostsController::PER_PAGE
    end

    it "shows only active posts" do
      posts = [
        FactoryGirl.create(:post),
        FactoryGirl.create(:post, active: false)
      ]

      get :index
      assigns(:posts).count.must_equal 1
      posts.first.must_equal assigns(:posts).first
    end
  end
end
