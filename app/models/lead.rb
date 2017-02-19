class Lead < ApplicationRecord
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates :email, uniqueness: true
  validates_uniqueness_of :email, :scope => :lead_type
end
