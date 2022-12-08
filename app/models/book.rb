class Book < ApplicationRecord
  belongs_to :user
  validates :title, :body, presence: true
  validates :body, length: {in: 2..200}
end
