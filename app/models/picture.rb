class Picture < ApplicationRecord

  belongs_to :user
  
  validates :title, presence: true
  validates :artist, presence: true, length: {minimum: 3}, length: {maximum: 20}
  validates :url, presence: true, uniqueness: true

end
