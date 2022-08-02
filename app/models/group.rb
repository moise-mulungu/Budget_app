class Group < ApplicationRecord
    belongs_to :users
    has_many_and_belongs_to :entities
end
