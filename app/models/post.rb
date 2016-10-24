class Post < ApplicationRecord
  validate :title, length: {minimum: 3, maximum: 64}
  validate :html, presence: true
  validate :css, presence: true
end
