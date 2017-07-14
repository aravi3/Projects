class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING),
    message: "%{value} is not a valid status" }
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

    def approve!
      raise "not pending" unless self.status == "PENDING"
      transaction do
        self.status = "APPROVED"
        self.save!
        overlapping_pending_requests.update_all(status: "DENIED")
      end
    end

    def deny!
      self.status = "DENIED"
      self.save!
    end

    def pending?
      self.status == "PENDING"
    end

  private

  def overlapping_requests
    overlap = CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where(<<-SQL, start_date: start_date, end_date: end_date)
        NOT( (start_date > :end_date) OR (end_date < :start_date) )
      SQL

      # if !overlap.empty?
      #   errors[:base] << "Overlaps with existing reservation for given cat"
      # end
    overlap
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: "PENDING")
  end

  def does_not_overlap_approved_request
    if !overlapping_approved_requests.empty?
      errors[:base] << "Overlaps with existing approved reservation for given cat"
    end
  end





end
