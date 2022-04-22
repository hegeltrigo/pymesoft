
// form validation 


$("#service").validate({
  errorClass: "text-danger",
  errorElement: "div",
  rules: {
      'service[name]': {
          required: true,
          minlength: 1,
          maxlength: 40
      },
      'service[price]': {
          required: true,
          number: true
      }

  },
  onkeyup: false
});