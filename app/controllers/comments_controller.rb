class CommentsController < ApplicationController
  before_action :set_comment, except: [:index, :new, :create]
  before_action :set_product

  def index
    render json: @comments = @product.comments
  end

  def new
    @product.comments.new
  end

  def create
    @comment = @product.comments.new(comment_params)
    render json: { comment: @comment, message: "Comment added" } if @comment.save!
  end

  def show
    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: { comment: @comment, message: "Comment modified" }
    else
      render json: { errors: @comment.errors }
    end
  end

  def destroy
    return unless @comment.destroy

    render json: { message: "Comment deleted" }
  end

  private

  def set_comment
    @comment ||= Comment.find(params[:id])
  end

  def set_product
    @product ||= Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :product_id, :user_id)
  end
end
