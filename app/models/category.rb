class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true

  # Budget limit can be optional
  validates :budget_limit, numericality: { greater_than: 0, allow_nil: true }

  # Return spent amount
  def amount_spent
    payments.sum(:amount)
  end

  # Return remaining budget
  def remaining_budget
    return nil unless budget_limit.present?
    budget_limit - amount_spent
  end

  # Return budget status as percentage
  def budget_percentage
    return 0 unless budget_limit.present? && budget_limit > 0
    ((amount_spent / budget_limit) * 100).round(2)
  end

  # Check if budget is exceeded
  def budget_exceeded?
    return false unless budget_limit.present?
    amount_spent > budget_limit
  end
end
