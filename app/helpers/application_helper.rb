module ApplicationHelper

  def page_title
    @post.try(:title) ? @post.title : 'KvaziBlog - ruby / rails / web development'
  end

  def first_post_link
    post_path(Post.active.first) rescue '/'
  end

end
