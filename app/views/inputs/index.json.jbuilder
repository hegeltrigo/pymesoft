json.total Input.count
json.rows @result do |input|
  json.sku input.item.sku
  json.product truncate("#{input.item.name}", :length => 20)
  json.input_date input.input_date.strftime("%d/%m/%Y")
  json.quantity input.quantity
  json.supplier truncate("#{input.supplier.name}", :length => 20)
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/inputs/#{input.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/inputs/#{input.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/inputs/#{input.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
