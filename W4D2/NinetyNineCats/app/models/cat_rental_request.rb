class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"],
    message: "%{value} is not a valid status"
  }

  validate :does_not_overlap_approved_request

  belongs_to(:cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: 'Cat'
  )

  def approve!
    transaction do
      requests = overlapping_pending_requests
      self.status = "APPROVED"
      self.save
      requests.each do |request|
        request.deny!
      end
    end
  end

  def deny!
    self.status = "DENIED"
    self.save
  end

  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat.id).where.not(id: self.id).where(
    "cat_rental_requests.start_date < ? AND ? < cat_rental_requests.end_date",
    self.end_date, self.start_date
    )
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
    # result = []
    # requests.each do |request|
    #   result << request if request.status == "APPROVED"
    # end
    # result
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists? && self.status != "DENIED"
      errors[:cat_id] << "cannot rent the same cat out to multiple folks"
    end
  end

  # validates :birth_date, :color, :name, :sex, :description, presence: true
  # validates :color, inclusion: { in: COLORS,
  #   message: "%{value} is not a valid color" }
  #
  #   create_table :cat_rental_requests do |t|
  #     t.integer :cat_id, null: false
  #     t.date :start_date, null: false
  #     t.date :end_date, null: false
  #     t.string :status, default: "PENDING", null: false
  #     t.timestamps null: false
end
