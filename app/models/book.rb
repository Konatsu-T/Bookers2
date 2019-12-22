class Book < ApplicationRecord

  validates :title, :body, presence: true, length: { maximum: 200 }

  belongs_to :user


end