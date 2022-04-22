json.total Supplier.count
json.rows @result do |supplier|
  json.name supplier.name
  json.address supplier.address
  json.identifier supplier.identifier
  json.cellphone supplier.cellphone
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/suppliers/#{supplier.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/suppliers/#{supplier.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/suppliers/#{supplier.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
