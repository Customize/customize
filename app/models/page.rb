class Page
  include Mongoid::Document

  field :title,   type: String
  field :content, type: String
  field :author,  type: String
end
