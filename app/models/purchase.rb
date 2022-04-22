class Purchase < ApplicationRecord
  belongs_to :supplier
  enum ticket_type: [:invoice, :dui]
  attribute :value

  def self.get_ticket_type
    {
    "Factura" => ticket_types[:invoice],
    "DUI" => ticket_types[:dui]
    }
  end

    def get_sales_type
      return "Compras para mercado interno con destino a actividades gravada" if self.sales_type == 1
      return "Compras para mercado interno con destino a actividades no gravadas" if self.sales_type == 2
      return "Compras sujetas a proporcionalidad" if self.sales_type == 3
      return "Compras para exportaciones" if self.sales_type == 4
      return "Compras tanto para el mercado interno como para exportaciones" if self.sales_type == 5
      
  end

  def value
    return self.invoice_number || self.dui_number
  end
end
