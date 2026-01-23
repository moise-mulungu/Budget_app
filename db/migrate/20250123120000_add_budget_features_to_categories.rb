class AddBudgetFeaturesToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :budget_limit, :decimal, precision: 10, scale: 2, allow_nil: true
    add_column :categories, :description, :text, allow_nil: true
  end
end
