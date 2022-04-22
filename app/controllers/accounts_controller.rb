class AccountsController < ApplicationController
  layout 'account'
  # skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @account = Account.new
    @account.build_owner
  end

  def create
    @account = Account.new(account_params)
    # @account.owner.role = :admin
    if @account.valid?
      Apartment::Tenant.create(@account.subdomain)
      Apartment::Tenant.switch!(@account.subdomain)   
      @account.save

      respond_to do |format|
        if @account.save
          format.html { redirect_to new_account_path, notice: 'Revise su correo electronico, para confirmar la cuenta'}
          format.json { render :show, status: :created, location: @account }
        else
          format.html { render :new }
          format.json { render json: @account.errors, status: :unprocessable_entity }
        end
      end

    else
      render action: 'new'
    end
  end

  private
  def account_params
    params.require(:account).permit(:subdomain, owner_attributes: [:image, :email, :password, :password_confirmation])
  end
end
