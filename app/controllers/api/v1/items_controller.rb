class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /Items
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result.where("amount_stock >= ?", 1).limit(20)
    render json: @items
  end

  # GET /Items/1
  def show
    render json: @item
  end

  # POST /Items
  def create
    @item = item.new(item_params)
    @item.user = current_user

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Items/1
  def destroy
    if @item.destroy
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :description)
    end
end
