class Categorization < ActiveRecord::Base
  belongs_to :topic
  belongs_to :document
end
