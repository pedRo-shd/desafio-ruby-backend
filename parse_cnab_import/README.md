# Import and Parsers to record CNAB file of financial transactions by Store

Dependencies:
* Ruby 2.7.2
* Rails 6.1.0
* Node.js 14.15.1
* Yarn 1.12.1

## Getting Started

* Clone the repository:
```
git@github.com:pedRo-shd/desafio-ruby-backend.git
```

* Go to the project
```
cd parse_cnab_import
```


* Run the commands below, after installing Dependencies:
```
bundle install
```
```
bundle exec rails webpacker:install
```
```
yarn install
```
```
bundle exec rails db:create db:migrate
```

* Run only Test with RSpec:
```
bundle exec rspec
```

* To Up project run:
```
bundle exec rails s
```

## STEP to upload and see operations transactions by store
* 1 - Access Page Root showing the list of stores with a button that redirects to the CNAB Upload
```
localhost:3000
```

* 2 - Click button Import CNAB

* 3 - Upload the correct CNAB file (CNAB.txt)

* 4 - After upload and saving, the application will redirect to the list of Stores

* 5 - Now you can clock to view each store's financial transactions

* 6 - Details Store with operations financial transactions and total account balance

---
