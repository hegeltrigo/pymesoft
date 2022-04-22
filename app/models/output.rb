class Output < ApplicationRecord
  # include SchemaSearchable
  # searchkick index_name: tenant_index_name, text_start: [:output_date]

  validates :item_id, :output_date, :quantity, presence: true

  belongs_to :item

  before_create :update_stock_for_create
  before_update :update_stock_for_update
  before_destroy :update_stock_for_destroy

  def update_stock_for_create
    self.item.update(output: self.item.output + self.quantity)
    update_stock
  end  

  def update_stock_for_update
    if self.quantity_changed?
      self.item.update(output: (self.item.output - self.quantity_was) + self.quantity)
    end
    update_stock
  end  

  def update_stock_for_destroy
    self.item.update(output: self.item.output - self.quantity)
    update_stock
  end  

  def update_stock
    self.item.update(amount_stock: self.item.input - self.item.output)
  end  

end
