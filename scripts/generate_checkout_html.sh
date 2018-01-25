#!/bin/sh
cat << EOS > public/index.html
<html>
  <head>
    <title>Stripe Checkout</title>
  </head>
  <body>
    <p>Send dummy infomation and get token (ex: tok_XXXXXXXXXXXXXXXXXXXXXXXX) from console.</p>
    <script src="https://checkout.stripe.com/checkout.js"></script>

    <button id="customButton">Purchase</button>

    <script>
      var handler = StripeCheckout.configure({
        key: '$PUBLISHABLE_KEY',
        image: 'https://stripe.com/img/documentation/checkout/marketplace.png',
        locale: 'auto',
        token: function(token) {
          // You can access the token ID with \`token.id\`.
          // Get the token ID to your server-side code for use.
          console.log(token.id);
        }
      });

      document.getElementById('customButton').addEventListener('click', function(e) {
        // Open Checkout with further options:
        handler.open({
          name: 'Demo Site',
          description: '2 widgets',
        });
        e.preventDefault();
      });

      // Close Checkout on page navigation:
      window.addEventListener('popstate', function() {
        handler.close();
      });
    </script>
  </body>
</html>
EOS
