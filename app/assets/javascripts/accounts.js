$("#company_signup").validate({
    errorClass: "text-danger",
    errorElement: "div",
    rules: {
        'account[owner_attributes][email]': {
            required: true,
            email: true //,
            // remote: "/check_email/signup"
        },
        'account[owner_attributes][password]': {
            required: true,
            minlength: 6,
            maxlength: 128
        },
        'account[owner_attributes][password_confirmation]': {
            required: true,
            minlength: 6,
            maxlength: 128,
            equalTo : '#account_owner_attributes_password'
        },
        'account[subdomain]': {
            required: true,
            minlength: 4,
            maxlength: 10
        },
    },
    messages: {
      // 'user[email]': {
      //   remote: "Este correo ya ha sido tomado"
      // }
    },
    onkeyup: false
});
