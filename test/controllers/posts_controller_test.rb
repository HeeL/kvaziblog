require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  describe "show" do
    it "shows active posts" do
      post = FactoryGirl.create(:post)
      get :show, id: post.id

      assert_response :success
      assigns(:post).id.must_equal post.id
    end

    it "doesn't show not active posts" do
      post = FactoryGirl.create(:post, active: false)
      get :show, id: post.id

      assert_response :not_found
    end

    it "shows not active posts for admin" do
      post = FactoryGirl.create(:post, active: false)
      sign_in FactoryGirl.create(:admin_user)
      get :show, id: post.id

      assert_response :success
      assigns(:post).id.must_equal post.id
    end

  end

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
