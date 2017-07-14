class Post < ApplicationRecord
  validates :title, :subs, :author, presence: true

  has_many :joins, inverse_of: :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Join

  has_many :subs,
    through: :joins,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :comments
  
end
