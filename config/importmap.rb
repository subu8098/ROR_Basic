# Pin npm packages by running ./bin/importmap
pin "custom/simple_toggle", to: "custom/simple_toggle.js"

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true  
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery" # @3.7.1
