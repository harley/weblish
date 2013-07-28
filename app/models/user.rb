class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :documents
  has_many :relationships, foreign_key: "follower_id"
  has_many :reversed_relationships, foreign_key: "followed_id", class_name: "Relationship"
  has_many :followed_users, through: :relationships, source: :followed
  has_many :followers, through: :reversed_relationships
  has_many :interests
  has_many :topics, through: :interests

  after_initialize :set_interests

  def to_s
    email
  end

  def documents_read_count
    'XXX'
  end

  def display_name
    email
  end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def popular_documents_from_followed
    Document.where(user_id: followed_user_ids)
  end

  def set_interests
    if new_record? and self.topics.empty?
      self.topics = Topic.all
    end
  end
end
