# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "slim-select" # @2.9.2
pin "tailwindcss-animate" # @1.0.7
pin "tailwindcss/plugin", to: "tailwindcss--plugin.js" # @3.4.17
