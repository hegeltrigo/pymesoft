json.total Output.count
json.rows @result do |output|
  json.sku output.item.sku
  json.product truncate("#{output.item.name}", :length => 20)
  json.output_date output.output_date.strftime("%d/%m/%Y")
  json.quantity output.quantity
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info' href='/outputs/#{output.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary' href='/outputs/#{output.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger' rel='nofollow' data-method='delete' href='/outputs/#{output.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
