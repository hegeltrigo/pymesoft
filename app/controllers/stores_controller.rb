class StoresController < ApplicationController
	before_action :authenticate_user!
  before_action :set_store, only: [:show, :edit, :update, :destroy]
	# GET /stores
  # GET /stores.json
	def index
    q_params = {"q": {"name_or_description_cont": params[:search]}}
    per_page = params[:limit] || 10
    page = params[:offset] || 0
    @q = Store.ransack(q_params[:q])
    @result = @q.result.page(1).per(per_page).offset(page)
	end

	# GET /stores/1
  # GET /stores/1.json
  def show
	end
	
	# GET /stores/new
	def new
		@store = Store.new
	end

	# POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Almacen fué creado exitosamente.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
	end
	
	# PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Almacen fué modificado exitosamente.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
	end
	
	# DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Almacen fué eliminado exitosamente.' }
      format.json { head :no_content }
    end
	end
	
	private

	def set_store
		@store = Store.find(params[:id])
	end

	def store_params
		params.require(:store).permit(:name, :description)
	end

end
