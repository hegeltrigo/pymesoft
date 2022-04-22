class Treasury::JournalController < ApplicationController
  def index
    if session[:petty_cash_active]
      @petty_cash = Treasury::PettyCash.find(session[:petty_cash_active]["id"])
      @journals = ( @petty_cash.treasury_inputs + @petty_cash.treasury_outputs ).sort_by(&:created_at)
    else
      @journals = []
    end
  end
end
