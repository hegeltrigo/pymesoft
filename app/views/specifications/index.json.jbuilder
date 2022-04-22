json.total @result.length
json.rows @result do |specification|
  json.name truncate("#{specification.name}", :length => 20)
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/specifications/#{specification.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/specifications/#{specification.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/specifications/#{specification.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
