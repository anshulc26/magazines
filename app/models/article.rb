class Article < ApplicationRecord
	## Relations
	belongs_to :user
	belongs_to :magazine
	has_many :comments, as: :commentable

  ## Validations
  validates_presence_of :body, :title
	validates_uniqueness_of :title
	validates_length_of :title, maximum: 50
	validates_length_of :body, minimum: 50
end
