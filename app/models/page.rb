class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :posts

  field :title,   type: String
  field :content, type: String
  field :mother,  type: String
  field :author,  type: String
end
