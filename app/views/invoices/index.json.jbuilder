json.total @result.length
json.rows @result do |invoice|
  json.date invoice.created_at
  json.number invoice.number
  json.amount invoice.try(:amount)
  json.client invoice.sales.length
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/invoices/#{invoice.id}'>
    <i class='fa fa-eye'></i>
</a>                    <a class='btn btn-icon btn-primary btn-sm' href='/invoices/#{invoice.id}/edit'>
    <i class='fa fa-edit'></i>
</a>                    <a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/invoices/#{invoice.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
