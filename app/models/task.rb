class Task < ApplicationRecord
  include Visible

  has_many :lists

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :due_at, presence: true

end