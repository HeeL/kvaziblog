ActiveAdmin.register Post do
  permit_params :title, :desc, :text, :active

  index do
    column :title
    column :created_at
    column :active do |post|
      post.active ? "Yes" : "No"
    end
    default_actions
  end

  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :desc
      f.input :text
      f.input :active, as: :boolean
      f.actions
    end
  end

end
