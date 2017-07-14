class Join < ApplicationRecord
  validates :sub, :post, presence: true

  belongs_to :sub
  belongs_to :post
end
