document.addEventListener("redirect", (e) => {
  Turbolinks.visit(e.detail.url)
});
