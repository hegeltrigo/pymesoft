json.total Store.count
json.rows @result do |store|
  json.name truncate("#{store.name}", :length => 20)
  json.description truncate("#{store.description}", :length => 20)
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/stores/#{store.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/stores/#{store.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/stores/#{store.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
