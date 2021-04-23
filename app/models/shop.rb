class Shop < ApplicationRecord
  has_many :products, dependent: :delete_all
  has_and_belongs_to_many :taxons

  private

  def set_slug
    self.slug = slug.to_s.parameterize
  end

end
