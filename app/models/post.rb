class Post < ActiveRecord::Base
  belongs_to :admin
  has_many :comments 
  has_and_belongs_to_many :tags
  
  validates :title, :presence => true
  validates :body, :presence => true

 end