class Applicant < ActiveRecord::Base
  validates :name, :fname, :address, :dob,:contact,  presence: true
  validates :edu, :numericality => { :greater_than => 70, :less_than_or_equal_to => 100 }, :presence => true
  validates :username, :uniqueness => true
  has_many :comments
  accepts_nested_attributes_for :comments
  # validate :valid_date?

  # def valid_date?
  #   unless Chronic.parse(dob)
  #     errors.add(:dob, "is missing or invalid")
  #   end
  # end
  def method_name

  end
end
