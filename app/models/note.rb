class Note < ApplicationRecord

  validates :title, presence: true, length: { in: 1..10}
  validates :description, presence: true, length: { in: 1..120}
end
