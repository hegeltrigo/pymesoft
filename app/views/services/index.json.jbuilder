json.total @result.length
json.rows @result do |service|
  json.name service.name
  json.price service.price
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/services/#{service.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/services/#{service.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/services/#{service.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
