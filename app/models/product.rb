class Product < ApplicationRecord
    include PgSearch::Model

    pg_search_scope :search_by_title, against: { title: 'A' , description: 'B'}, using: { tsearch: { dictionary: 'english', tsvector_column: 'searchable', prefix: true} }
    pg_search_scope :search_by_brand, against: :brand, using: { tsearch: { dictionary: 'english' } }

    has_many :comment

    def self.ransackable_attributes(auth_object = nil)
        ["brand", "category", "created_at", "description", "discountPercentage", "id", "images", "price", "rating", "searchable", "stock", "thumnail", "title", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["comment"]
    end
end
