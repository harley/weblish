class Document < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :topics, through: :categorizations#, source: :topic

  mount_uploader :file, DocumentUploader

  validates :file, presence: true
  validates :tagline, presence: true
  # validates :user_id, presence: true

  default_scope -> { order('created_at DESC') }

  acts_as_commentable
  acts_as_votable

  after_save :set_name_if_not_presence

  include PgSearch
  pg_search_scope :search, against: [:title, :tagline, :author, :class_name, :class_code, :department, :professor, :keywords],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {topics: :name},
    ignoring: :accents

  def to_s
    (title || name || file).presence || 'Untitled'
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

  def liked_by?(user)
    if user
      likes.exists?(voter_id: user.id, voter_type: user.class.name)
    end
  end

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  def likes_count
    likes.size
  end

  def comments_count
    comments.size
  end
end
