class HomesController < ApplicationController

  # GET /admin/products
  def index
    @shops = Shop.where("created_at <= ?", Time.zone.now)
  end

end
