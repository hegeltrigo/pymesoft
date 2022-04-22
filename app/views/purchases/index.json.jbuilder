json.total @result.length
json.rows @result do |purchase|
  json.date purchase.purchase_date.strftime("%d/%m/%Y")
  json.number purchase.invoice_number || purchase.dui_number
  json.supplier truncate("#{purchase.supplier.name}", :length => 20)
  json.amount purchase.amount
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/purchases/#{purchase.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/purchases/#{purchase.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/purchases/#{purchase.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
