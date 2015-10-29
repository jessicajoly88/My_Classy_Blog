class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :admin
  validates :content, :presence => true
end
