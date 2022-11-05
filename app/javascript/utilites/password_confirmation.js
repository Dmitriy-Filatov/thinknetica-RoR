document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.check-confirm')
  if (control) { control.addEventListener('input', checkPassword) }
})

function checkPassword() {
  var password = document.getElementById('user_password')
  var passwordConfirm = document.getElementById('user_password_confirmation')
  var successMatchElArr = document.querySelectorAll('.octicon-check')
  var failureMatchElArr = document.querySelectorAll('.octicon-x')
  var passwordsArray = [password, passwordConfirm]

  if (passwordConfirm.value === '') {
    passwordsArray.forEach(el => {
      el.classList && el.classList.remove('border-green')
      el.classList && el.classList.remove('border-red')
    })

    successMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })

    failureMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })
  } else if (password.value === passwordConfirm.value) {
    passwordsArray.forEach(el => {
      el.classList && el.classList.add('border-green')
      el.classList && el.classList.remove('border-red')
    })

    successMatchElArr.forEach(element => {
      element.classList && element.classList.remove('hide')
    })

    failureMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })
  } else {
    passwordsArray.forEach(el => {
      el.classList && el.classList.remove('border-green')
      el.classList && el.classList.add('border-red')
    })

    successMatchElArr.forEach(element => {
      element.classList && element.classList.add('hide')
    })

    failureMatchElArr.forEach(element => {
      element.classList && element.classList.remove('hide')
    })
  }
}
