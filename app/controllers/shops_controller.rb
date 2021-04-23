class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :set_content

  def index
    @shops = Shop.all
  end

  def show
    @products = Product.where(shop_id: @shop.id)
    @taxons = Taxon.all
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.taxon_ids = params[:shop][:taxon_ids]

    if @shop.save
      redirect_to [:admin, @shop], notice: 'Shop was successfully created.'
    else
      render :new
    end
  end

  def update
    if @shop.update(shop_params)
      @shop.taxon_ids = params[:shop][:taxon_ids]
      redirect_to [:admin, @shop], notice: 'Shop was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy

    redirect_to admin_shops_url, notice: 'Shop was successfully destroyed.'
  end

  private

  def set_content
    @content_title = @shop.name
    @taxonomies = Taxon.all
    @content = []
    @taxonomies.each do |taxon|
      if taxon.products.find_products(@shop.id).present?
        @content <<  taxon.id
      end
    end
    @side_content = Taxon.where(id: @content)
  end

  def set_shop
    @shop = Shop.find_by!(slug: params[:slug])
  end

  def shop_params
    params.require(:shop).permit(:name, :slug, :available_on)
  end
end
