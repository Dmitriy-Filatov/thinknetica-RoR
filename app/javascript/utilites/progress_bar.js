document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('.test-passage-progress')

  if (progress) {
    percent = progress.dataset.percent
    bar = progress.querySelector('.progress-bar')
    bar.style.width = percent + '%'
  }
})
