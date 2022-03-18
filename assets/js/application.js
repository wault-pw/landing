document.addEventListener('click', function(event) {
  const $el = event.target.closest('a[data-toggle]')
  if (!$el) return
  const selector = $el.getAttribute('data-toggle')

  document.querySelectorAll(selector).forEach((node) => {
    node.classList.toggle('shown')
  })
}, false);
