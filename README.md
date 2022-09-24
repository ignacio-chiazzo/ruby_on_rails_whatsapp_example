## Instructions
1- Make sure that the gemfile is pointing to the right `whatsapp_sdk` version.
1- Run the server `bundle exec rails s`
1- Run `ngrok http 3000` 
Copy the ngrok address from th console e.g. `https://1234-123-123-12-123.ngrok.io`
1- Add the address to the `config/environments/development.rb` file.
1- Go to the Meta panel and subscribe to the webhook. You will need to paste the ngrok address in Meta.
