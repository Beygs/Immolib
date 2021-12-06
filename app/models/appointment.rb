class Appointment < ApplicationRecord
  belongs_to :candidate, class_name: "User"
  belongs_to :slot
  has_one :property, through: :slot
end