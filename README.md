# README

```
$ ruby -v
2.5.0
$ bundle install

# Get keys from https://dashboard.stripe.com/account/apikeys
$ export PUBLISHABLE_KEY=pk_test_XXXXXXXXXXXXXXXXXXXXXXXX
$ export SECRET_KEY=sk_test_XXXXXXXXXXXXXXXXXXXXXXXX

# Configure config/database.yml and Setup database
$ bin/rails db:create db:migrate db:seed
$ bin/rails s

# Generate HTML and access to it
$ sh scripts/generate_checkout_html.sh
$ open http://localhost:3000

$ curl -X POST \
>  http://localhost:3000/booking \
>  -H 'content-type: application/json' \
>  -d '{
>  "roomId": 1,
>  "stripeToken": "tok_XXXXXXXXXXXXXXXXXXXXXXXX",
>  "stripeEmail": "xxxxx@example.com",
>  "firstNightOn": "2018-03-11",
>  "lastNightOn": "2018-04-10"
>}'
```
