json.total @result.length
json.rows @result do |invoice_dosage|
  json.authorization_number invoice_dosage.authorization_number
  json.emission_deadline invoice_dosage.emission_deadline.strftime("%d/%m/%Y")
  json.economic_activity invoice_dosage.economic_activity
  json.active "#{invoice_dosage.active ? 'SI' : 'NO'}"
  json.actions "<div class='text-center'>
  <a class='btn btn-icon btn-info btn-sm' href='/invoice_dosages/#{invoice_dosage.id}'>
    <i class='fa fa-eye'></i>
</a>
<a data-confirm='¿Estás seguro(a)?' class='btn btn-icon btn-danger btn-sm' rel='nofollow' data-method='delete' href='/invoice_dosages/#{invoice_dosage.id}'>
    <i class='fa fa-remove'></i>
</a>                  </div>"

end
