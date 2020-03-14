class Api::ProductsController < ApplicationController
  
  def index
    @products = Product.all
    if params[:search]
      @recipes = Recipe.where("ingredients LIKE ?", "%#{params[:search]}%")
    else 
      @recipes = Recipe.all
    end
      render "index.json.jb"
  end 
  
  def show
    @products = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image_url: params[:image_url],
    )
    @product.save
    render "show.json.jb"
    
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])
    if @product.update
    name = params[:name] || @product.name
    price = params[:price] || @product.price,
    description = params[:description] || @product.description
    image_url = params[:image_url] || @product.image_irl

    @product.save
    render "show.json.jb"
  end
end
