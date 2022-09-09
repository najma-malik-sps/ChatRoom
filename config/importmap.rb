# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
# pin "@hotwired/stimulus-scroll-to", to: "stimulus-scroll-to.js", preload: true
pin "@hotwired/stimulus-scroll-to", to: "https://ga.jspm.io/npm:stimulus-scroll-to@4.0.0/dist/stimulus-scroll-to.es.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "stimulus-scroll-to" # @4.0.0
