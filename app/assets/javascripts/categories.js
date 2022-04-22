// form validation 

$("#category").validate({
  errorClass: "text-danger",
  errorElement: "div",
  rules: {
      'category[name]': {
          required: true,
          minlength: 1,
          maxlength: 40
      },
      'category[description]': {
          required: true
      }

  },
  onkeyup: false
});