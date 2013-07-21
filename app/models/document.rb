class Document < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :topics, through: :categorizations

  mount_uploader :file, DocumentUploader

  validates :file, presence: true
  validates :user_id, presence: true

  default_scope -> { order('created_at DESC') }

  acts_as_commentable

  after_save :set_name_if_not_presence

  def to_s
    (name || file).presence || 'Untitled'
  end

  def set_name_if_not_presence
    if self.name.blank? && file?
      self.update_column :name, file.file.filename
    end
  end

  def description
    "TO BE ADDED"
  end

  def self.popular
    # TODO: implement this after having likes
    order("created_at DESC")
  end
end
