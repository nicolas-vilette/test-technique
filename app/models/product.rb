class Product < ApplicationRecord
  belongs_to :shop
  has_and_belongs_to_many :taxons

  scope :find_products, ->(shop) { where("shop_id = ?", shop) }

end
