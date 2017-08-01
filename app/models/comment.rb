class Comment < ApplicationRecord
	## Relations
	belongs_to :article
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  ## Validations
  validates_presence_of :body
  
  def article
    return @article if defined?(@article)
    @article = commentable.is_a?(Article) ? commentable : commentable.article
  end
end
