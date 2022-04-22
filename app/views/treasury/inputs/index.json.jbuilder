json.total @petty_cash.treasury_inputs.count
json.rows @result do |input|
  json.description truncate("#{input.description}", :length => 20)
  json.quantity input.quantity
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/treasury/inputs/#{input.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/treasury/inputs/#{input.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/treasury/inputs/#{input.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
