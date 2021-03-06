class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  skip_before_action :authenticate_request, only: [:index, :show]

  def index
    @products = Product.order(created_at: :desc)
    render json: ProductSerializer.new(@products).serializable_hash
  end

  def new
  end

  def create
    @product = current_user.products.create(product_params)
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
    add_remove_tags

    if @product.save(product_params)
      render json: { product: ProductSerializer.new(@product), message: "Product updated" }
    else
      render json: { error: @product.errors }
    end
  end

  def destroy
    return unless @product.destroy

    render json: { message: "Product deleted" }
  end

  def add_remove_tags
    if params[:tags].present?
      @product.tag_list.add(params[:tags], parse: true)
      @product.save
    end

    if params[:remove_tags].present?
      @product.tag_list.remove(params[:remove_tags], parse: true)
      @product.save
    end
  end

  private

  def set_product_user
    @user ||= User.find(params[:user_id])
  end

  def set_product
    @product ||= Product.find(params[:id])
  end

  def product_params
    params.permit(:name, :description, :user_id, :tag_list, :tags,
                  comments: [:id, :product_id, :user_id, :_destroy])
  end
end
