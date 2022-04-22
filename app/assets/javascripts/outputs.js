$("#output").validate({
  errorClass: "text-danger",
  errorElement: "div",
  rules: {
      'output[item_id]': {
          required: true,
      },
      'output[output_date]': {
        required: true,
      },
      'output[quantity]': {
        required: true,
        number: true
      },
      'output[description]': {
          required: true
      }

  },
  onkeyup: false
});