class Cat < ActiveRecord::Base

  COLOR_OPTIONS = %w(red black white grey brown)

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLOR_OPTIONS,
    message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(m f), message: "%{value} is not a valid sex" }

  def age
    Time.now.year - self.birth_date.year
  end

  has_many :cat_rental_requests, dependent: :destroy,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest
end
