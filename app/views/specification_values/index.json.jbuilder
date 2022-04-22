json.total Specification.count
json.rows @result do |specification_value|
  json.name truncate("#{specification_value.value}", :length => 20)
  json.category Specification.find(specification_value.specification_id).name
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/specification_values/#{specification_value.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/specification_values/#{specification_value.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/specification_values/#{specification_value.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
