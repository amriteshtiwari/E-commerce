class Comment < ApplicationRecord
    belongs_to :product
    belongs_to :user
    has_many :reply

    def self.ransackable_attributes(auth_object = nil)
        ["body", "created_at", "id", "product_id", "updated_at", "user_id"]
    end
end
