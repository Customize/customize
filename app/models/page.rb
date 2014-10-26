class Page
  include Mongoid::Document

  field :title,          type: String
  field :author,         type: String
  field :data,           type: String
  field :mother,         type: String
end
