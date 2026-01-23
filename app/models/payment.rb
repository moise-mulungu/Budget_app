class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true
  validates :user_id, presence: true
  validates :name, presence: true

  # Scopes for filtering
  scope :recent, -> { order(created_at: :desc) }
  scope :by_date_range, ->(start_date, end_date) { where(created_at: start_date..end_date) }

  # Return formatted amount
  def formatted_amount
    format('$%.2f', amount)
  end
end
