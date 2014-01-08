module ApplicationHelper

  def page_title
    @post.try(:title) ? @post.title : 'KvaziBlog - ruby / rails / web development'
  end

end
