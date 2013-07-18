class Topic < ActiveRecord::Base
  has_many :categorizations
  has_many :documents, through: :categorizations

  def to_s
    name
  end
end
