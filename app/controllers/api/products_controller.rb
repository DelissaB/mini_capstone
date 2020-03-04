class Api::ProductsController < ApplicationController
  def product
    render "product.json.jb"
  end
end
