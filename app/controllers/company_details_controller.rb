class CompanyDetailsController < ApplicationController
  before_action :set_company_detail, only: [:show, :edit, :update, :destroy]


  def index
    @company_detail = CompanyDetail.last
  end

  def new 
    @company_detail = CompanyDetail.new
  end

  def create
    @company_detail = CompanyDetail.new(company_detail_params)
    if @company_detail.save
      respond_to do |format|
        format.html { redirect_to company_details_url, notice: 'Datos actualizados exitosamente.' }
        format.json { render :show, status: :created, location: @company_detail }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @company_detail.update(company_detail_params)
        format.html { redirect_to company_details_url, notice: 'Datos actualizados exitosamente.' }
        format.json { render :show, status: :ok, location: @company_detail }
      else
        format.html { render :edit }
        format.json { render json: @company_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_company_detail
    @company_detail = CompanyDetail.find(params[:id])
  end

  def company_detail_params
    params.require(:company_detail).permit(:company_name, :nit, :address ,:city, :state, :country, :phone_number, :logo)
  end
end
