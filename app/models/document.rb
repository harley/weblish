class Document < ActiveRecord::Base
  belongs_to :user
  mount_uploader :file, DocumentUploader

  validates :file, presence: true
  validates :user_id, presence: true

  default_scope -> { order('created_at DESC') }

  acts_as_commentable

  after_save :set_name_if_not_presence

  def to_s
    name || file
  end

  def set_name_if_not_presence
    if self.name.blank? && file?
      self.name = file.file.filename
    end
  end
end
