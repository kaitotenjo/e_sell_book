# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.2/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.6/lib/index.js"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.2.1/js/fontawesome.js"
pin_all_from "app/javascript/admin", under: "admin"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
