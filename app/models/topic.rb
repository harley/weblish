class Topic < ActiveRecord::Base
  has_many :categorizations
  has_many :documents, through: :categorizations
end
