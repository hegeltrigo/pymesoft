class Treasury::Input < ApplicationRecord
  self.table_name = "treasury_inputs"

  belongs_to :treasury_petty_cash, class_name: 'Treasury::PettyCash'
end
