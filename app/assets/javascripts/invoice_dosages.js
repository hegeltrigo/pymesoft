// form validation 

$("#invoice_dosage").validate({
  errorClass: "text-danger",
  errorElement: "div",
  rules: {
      'invoice_dosage[authorization_number]': {
          required: true,
          minlength: 1,
          maxlength: 40
      },
      'invoice_dosage[emission_deadline]': {
          required: true
      },
      'invoice_dosage[invoice_initial_number]': {
        required: true,
        number: true
      },
      'invoice_dosage[dosage_key]': {
        required: true
      },
      'invoice_dosage[economic_activity]': {
        required: true
      }      

  },
  onkeyup: false
});