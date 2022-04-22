json.total Category.count
json.rows @result do |category|
  json.name truncate("#{category.name}", :length => 20)
  json.description truncate("#{category.description}", :length => 20)
  json.subcategory category.parent_id.present? ? "Si" : "No"
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/categories/#{category.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/categories/#{category.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/categories/#{category.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
