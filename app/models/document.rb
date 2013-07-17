class Document < ActiveRecord::Base
  mount_uploader :file, DocumentUploader

  validates :file, presence: true
  validates :name, presence: true

  def to_s
    name || file
  end
end
