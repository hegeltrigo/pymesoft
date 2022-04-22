$("#input").validate({
  errorClass: "text-danger",
  errorElement: "div",
  rules: {
      'input[item_id]': {
          required: true,
      },
      'input[input_date]': {
        required: true,
      },
      'input[quantity]': {
        required: true,
        number: true
      },
      'input[description]': {
          required: true
      }

  },
  onkeyup: false
});