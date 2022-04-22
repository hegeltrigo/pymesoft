  /*$("#login").validate({
      errorClass: "text-danger",
      errorElement: "div",
      rules: {
          'user[email]': {
              required: true,
              email: true,
              remote: "/check_email/login"
          },
          'user[password]': {
              required: true,
              minlength: 6,
              maxlength: 128
          }

      },
      messages: {
        'user[email]': {
          remote: "No tienes una cuenta, con esta dirección de correo."
        }
      },
      onkeyup: false
  });

  $("#signup").validate({
      errorClass: "text-danger",
      errorElement: "div",
      rules: {
          'user[email]': {
              required: true,
              email: true,
              remote: "/check_email/signup"
          },
          'user[password]': {
              required: true,
              minlength: 6,
              maxlength: 128
          },
          'user[password_confirmation]': {
              required: true,
              minlength: 6,
              maxlength: 128,
              equalTo : '#user_password'
          }
      },
      messages: {
        'user[email]': {
          remote: "Este correo ya ha sido tomado"
        }
      },
      onkeyup: false
  });

  */
