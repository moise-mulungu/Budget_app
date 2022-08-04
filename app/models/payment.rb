class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :name, presence: true

end
