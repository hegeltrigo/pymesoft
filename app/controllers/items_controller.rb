class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    q_params = {"q": {"name_or_description_cont": params[:search]}}
    per_page = params[:limit] || 10
    page = params[:offset] || 0
    @q = Item.ransack(q_params[:q])
    @result = @q.result.page(1).per(per_page).offset(page)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    specification_product = {}
    specification_product[:specification_value_id] = item_params[:specification_value_id]
    @item = Item.new(item_params.except(:specification_value_id))


    if @item.save
      specification_product[:item_id] = @item.id
      puts "#{specification_product}"
      specification = SpecificationProduct.new(specification_product)
      if !specification.save
        puts "#{specification.errors.full_messages}"
      end

      respond_to do |format|
        format.html { redirect_to @item, notice: 'Producto fué creado exitosamente.' }
        format.json { render :show, status: :created, location: @item }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Producto fué modificado exitosamente.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Producto fué eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:upc, :sku, :name, :description, :input, :output, :amount_stock, :price, :cost_price, :published, :category_id, :image, :specification_value_id)
    end
end
