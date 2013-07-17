class Document < ActiveRecord::Base
  belongs_to :user
  mount_uploader :file, DocumentUploader

  validates :file, presence: true
  validates :name, presence: true
  validates :user_id, presence: true

  default_scope -> { order('created_at DESC') }

  def to_s
    name || file
  end
end
