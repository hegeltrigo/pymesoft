json.total Item.count
json.rows @result do |item|
  json.name truncate("#{item.name}", :length => 20)
  json.description truncate("#{item.description}", :length => 20)
  json.price item.try(:price)
  json.amount_stock item.try(:amount_stock)
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/items/#{item.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/items/#{item.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/items/#{item.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
