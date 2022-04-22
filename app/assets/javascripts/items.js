
// form validation 


$("#item").validate({
  errorClass: "text-danger",
  errorElement: "div",
  rules: {
      'item[name]': {
          required: true,
          minlength: 1,
          maxlength: 40
      },
      'item[description]': {
          required: true,
          minlength: 1,
          maxlength: 40
      },
      'item[price]': {
        required: true,
        number: true
      },
      'item[cost_price]': {
        required: true,
        number: true
      },
      'item[sku]': {
        required: true
      }

  },
  onkeyup: false
});