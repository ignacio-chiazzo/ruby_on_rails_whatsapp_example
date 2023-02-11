# Ruby On Rails Whatsapp Example

This library is a Rails application example of using the [Ruby Whatsapp SDK library](https://github.com/ignacio-chiazzo/ruby_whatsapp_sdk) to communicate between a Web application with Whatsapp.
This application lets you send Whatsapp messages and view them on the Web.


## Demo

https://user-images.githubusercontent.com/11672878/193464439-d6ff27c8-4e48-4f9c-8998-b958274b69f6.mp4




### Getting started

1. Clone this repository.
1. Run `bundle install`.
1. Run the server `bundle exec rails s`
1. Modify the access token in the [`whatsapp_sdk` initializer](https://github.com/ignacio-chiazzo/ruby_on_rails_whatsapp_example/blob/main/config/initializers/whatsapp_sdk.rb#L2). Note that if you change the file you have to restart the server since the file lives under initializers.
1. Open the web application in your browser http://localhost:3000
1. Try sending a message on WhatsApp.

## Whatsapp Webhook

You can use webhooks to receive alerts when users communicate with your account. To do that, we need to start a service and an endpoint and tell Meta to ping that endpoint whenever a Meta event happens. See the [Meta documentation](https://developers.facebook.com/docs/whatsapp/cloud-api/webhooks/components) for the list of events available.

1. Make sure that the gemfile is pointing to the right `whatsapp_sdk` version.
1. Run the server `bundle exec rails s`.
1. Run `ngrok http 3000` 
Copy the ngrok address from the console e.g. `https://1234-123-123-12-123.ngrok.io`
1. Add the address to the `config/environments/development.rb` file.
1. Go to the Meta panel and subscribe to the webhook. You will need to paste the ngrok address in Meta.

### Development

This repository uses [tailwind-css rails](https://github.com/rails/tailwindcss-rails). To update the assets automatically, run `rails tailwindcss:watch`.
