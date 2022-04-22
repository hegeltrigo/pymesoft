class Treasury::PettyCash < ApplicationRecord
  self.table_name = "treasury_petty_cashes"

  has_many :treasury_inputs, class_name: 'Treasury::Input', foreign_key: 'treasury_petty_cash_id'
  has_many :treasury_outputs, class_name: 'Treasury::Output', foreign_key: 'treasury_petty_cash_id'

  def self.open_petty_cash
    start_date = DateTime.now
    end_date = nil
    active = true
    number = self.count + 1
    open = self.create(start_date: start_date, end_date: end_date, active: active, number: number)
  end

  def self.close(id)
    close = self.update(end_date: DateTime.now, active: false)
  end

end
