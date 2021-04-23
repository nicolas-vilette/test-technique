class HomesController < ApplicationController
  before_action :set_content

  def index
    @taxons = Taxon.all
    @images = [
      "https://images.unsplash.com/photo-1520617513539-7dddc453eb62?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80",
      "https://images.unsplash.com/photo-1587241321921-91a834d6d191?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80",
      "https://images.unsplash.com/photo-1504087697492-238a6bf49ce8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80",
      "https://images.unsplash.com/photo-1581163581460-88d78fb1ec4a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2467&q=80",
      "https://images.unsplash.com/photo-1532635224-cf024e66d122?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2700&q=80"
    ]
    @random_image = @images
  end

  private

  def set_content
    @content_title = "Commerçants en ligne"
    @taxons = Taxon.all
    @content = []
    @taxons.each do |taxon|
      if taxon.shops.present?
      @content <<  taxon.id
      end
    end
    @side_content = Taxon.where(id: @content)
  end

end
