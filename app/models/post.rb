class Post < ActiveRecord::Base

  validates :title, :desc, :text, presence: true

  scope :by_newest, -> {order(created_at: :desc)}

end
