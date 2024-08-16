pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "controllers", to: "controllers/index.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/activestorage", to: "activestorage.js"
pin "channels", to: "channels/index.js"
pin "application", to: "application.js"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
