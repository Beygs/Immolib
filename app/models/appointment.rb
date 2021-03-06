class Appointment < ApplicationRecord
  #Callbacks
  after_create :send_new_appointment_validation_email

  #Associations
  belongs_to :candidate, class_name: "User"
  belongs_to :slot
  has_one :property, through: :slot
  has_many_attached :candidate_documents, dependent: :destroy
  has_one_attached :candidate_dossierfacile_folder, dependent: :destroy

  #Validations
  validates :candidate_message, length: { in: 10..1000 }, allow_blank: true
  validates :candidate_dossierfacile_link, format: URI::regexp(%w[http https]), allow_blank: true

  private

  def send_new_appointment_validation_email
    UserMailer.new_appointment_validation_email(self).deliver_now
  end

end
