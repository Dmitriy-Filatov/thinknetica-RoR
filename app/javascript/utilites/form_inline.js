document.addEventListener('turbolinks:load', function() {
  var $controls = $('.form-inline-link')
  $controls.on('click', formInlineLinkHandler)

  // var controls = document.querySelectorAll('.form-inline-link')

  // if (controls.length) {
  //   for (var i = 0; i < controls.length; i++) {
  //     controls[i].addEventListener('click', formInlineLinkHandler)
  //   }
  // }

  var errors = document.querySelector('.resource-errors')

  if (($controls) && ($controls.length != 0) && (errors)) {
    var resourceId = errors.dataset.resourceId
    formInlinekHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlinekHandler(testId)
}

function formInlinekHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  // var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  // var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  $testTitle.toggle()
  $formInline.toggle()


  // if (formInline.classList.contains('hide')) {
  if ($formInline.is(':visible')) {
    // testTitle.classList.add('hide')
    // formInline.classList.remove('hide')
    link.textContent = 'Cancel'
  } else {
    // testTitle.classList.remove('hide')
    // formInline.classList.add('hide')
    link.textContent = 'Edit'
  }
}
