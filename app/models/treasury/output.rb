class Treasury::Output < ApplicationRecord
  self.table_name = "treasury_outputs"

  belongs_to :treasury_petty_cash, class_name: 'Treasury::PettyCash'
end
