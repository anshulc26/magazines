class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Relations
  has_many :magazines
  has_many :articles
  has_many :comments
  
  ## Validations
  validates_presence_of :first_name, :last_name

  def full_name
    name = ""
    if !self.first_name.present? || !self.last_name.present?
      name = self.email
    else
  	  name = "#{self.first_name}  #{self.last_name}"
    end
    name
  end
end
