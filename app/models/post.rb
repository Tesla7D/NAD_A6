class Post < ApplicationRecord
  validates :title, length: {minimum: 3, maximum: 64}
  validates :html, presence: true
  validates :css, presence: true
end
