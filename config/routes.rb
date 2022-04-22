class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  
 
  namespace :treasury do
    get 'journal/index'
  end
  # namespace :api, as: nil do
  #   namespace :v1, as: nil do
  #     devise_for :users,
  #               #  path: '', 
  #                controllers: {
  #                    :registrations => "api/v1/registrations",
  #                    :sessions => "api/v1/sessions"
  #                }
  #     resources :items
  #   end
  # end

  
  constraints(SubdomainPresent) do

    namespace :treasury do
      resources :outputs
      resources :inputs
      resources :petty_cashes do 
        collection do
          post :close_petty_cash
        end
      end
    end

    resources :customers
    resources :sales do
      collection do
        post :open_petty_cash
      end
    end  
    resources :services
    resources :invoice_dosages
    resources :outputs
    resources :inputs
    resources :items
    resources :categories
    resources :specifications
    resources :specification_values
    resources :suppliers
    resources :stores
    resources :company_details
    resources :purchases
    resources :invoices

    get "invoices/generate_invoice/:id", to: 'invoices#generate_invoice'
    get "book_purchase", to: "purchases#book_purchase"
    get "book_purchase/export_excel", to: "purchases#export_excel", :defaults => { :format => 'xlsx' }
    get "subcategory/new", to:  "categories#subcategory"
    get "book_sales/", to: "book_sales#index"
    get 'book_sales/export_excel', to: 'book_sales#export_excel', :defaults => { :format => 'xlsx' }
    devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations',
       confirmations: 'users/confirmations',
       passwords: 'users/passwords'
    }

    devise_scope :user do
      get "users/email_confirmation", :to => "users/registrations#email_confirmation"
      get "users/validate_session", :to => "users/sessions#validate_token"
    end

    match 'check_email/:type' => 'application#check_email', via: :get

    root 'dashboard#index', as: :subdomain_root

    namespace :api, as: nil do
      namespace :v1, as: nil do
        # devise_for :users,
        #           #  path: '', 
        #            controllers: {
        #                :registrations => "api/v1/registrations",
        #                :sessions => "api/v1/sessions"
        #            }
        resources :items
        resources :customers
      end
    end
  end

  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
  end

  # match '*a', :to => 'errors#routing', via: :get
end
