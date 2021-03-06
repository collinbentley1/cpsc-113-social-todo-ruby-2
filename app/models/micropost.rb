class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :content, presence: true, length: { maximum: 5000 }
  validates :collab1, length: { maximum: 50}   
  validates :collab2, length: { maximum: 50}   
  validates :collab3, length: { maximum: 50}   

end
