require 'date'

COLORS = ["white", "orange", "calico", "black", "brown", "beige"]

class Cat < ActiveRecord::Base


  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex" }

  def age
    d = Date.now
    d.year - @birth_date.year
  end

  has_many(:rental_requests,
  dependent: :destroy,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: 'CatRentalRequest'
  )

end
