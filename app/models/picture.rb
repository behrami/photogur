class Picture < ApplicationRecord
  validates :title, presence: true

  validates :artist, presence: true
  validates :artist, length: {minimum: 3}
  validates :artist, length: {maximum: 20}

  validates :url, presence: true
  validates :url, uniqueness: true

end
