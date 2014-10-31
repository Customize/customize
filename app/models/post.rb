class Post
  include Mongoid::Document

  belongs_to :page

  field :title,   type: String
  field :content, type: String
end
