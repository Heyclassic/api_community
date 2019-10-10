class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.all
    render json: ProductSerializer.new(@products).serializable_hash
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { product: @product, message: "Product created" }
    else
      render json: { error: @product.errors }
    end
  end

  def show
    render json: ProductSerializer.new(@product)
  end

  def update
    if @product.update(product_params)
      render json: { product: @product, message: "Product updated" }
    else
      render json: { error: @product.errors }
    end
  end

  def destroy
    return unless @product.destroy

    render json: { message: "Product deleted" }
  end

  private

  def set_product_user
    @user ||= User.find(params[:user_id])
  end

  def set_product
    @product ||= Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :user_id)
  end
end
