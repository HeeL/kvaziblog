require 'test_helper'

class PostTest < ActiveSupport::TestCase

  it "checks the precense of title, description and text" do
    post = FactoryGirl.build(:post)
    origin_post = post
    
    post.valid?.must_equal true

    post.title = ''
    post.valid?.must_equal false
    post.title = origin_post.title

    post.desc = ''
    post.valid?.must_equal false
    post.desc = origin_post.desc

    post.text = ''
    post.valid?.must_equal false
  end

end
