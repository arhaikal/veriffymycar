class Photo < ApplicationRecord
  belongs_to :document

  has_attached_file :face, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment :face, presence: true
  do_not_validate_attachment_file_type :face

  has_attached_file :document_front, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment :document_front, presence: true
  do_not_validate_attachment_file_type :document_front

  has_attached_file :document_back, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment :document_back, presence: true
  do_not_validate_attachment_file_type :document_back

end
