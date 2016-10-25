class Codepost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :title, length: {minimum: 3, maximum: 64}
  validates :html, presence: true
  validates :css, presence: true
  validates :user_id, presence: true
end
