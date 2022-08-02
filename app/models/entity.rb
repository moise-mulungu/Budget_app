class Entity < ApplicationRecord
    belongs_to :users
    has_many_and_belongs_to :groups
end
