require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  describe "index" do
    setup do
      @posts = [
        FactoryGirl.create(:post, created_at: 1.day.ago),
        FactoryGirl.create(:post)
      ]
    end

    it "shows the latest posts first" do
      get :index
      assert_response :success

      @posts.last.must_equal assigns(:posts).first
      @posts.first.must_equal assigns(:posts).last
    end

    it "paginates posts" do
      FactoryGirl.create_list(:post, PostsController::PER_PAGE + 1)
      get :index

      assigns(:posts).count.must_equal PostsController::PER_PAGE
    end
  end
end
