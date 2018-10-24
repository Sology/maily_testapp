# MailyHerald Test Application

This Rails 5 application demonstrates basic usage of [MailyHerald](https://github.com/Sology/maily_herald) - Ruby on Rails email processing solution.

## Setup

```
git clone https://github.com/Sology/maily_testapp
cd maily_testapp
bundle install
rake db:create
rake db:schema:load
rake db:seed
foreman start
```

In order to use [Mailcatcher](https://mailcatcher.me/), uncomment following lines in `config/environments/development.rb`:

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }

Install Mailcatcher and run it:

    gem install mailcatcher
    mailcatcher -fv

## More Information

* [Home Page](http://mailyherald.org)
* [API Docs](http://www.rubydoc.info/gems/maily_herald)
* [Showcase](http://showcase.sology.eu/maily_herald)

For bug reports or feature requests see the [issues on Github](https://github.com/Sology/maily_testapp/issues).  

## License

AGPLv3 License. Copyright Sology. http://www.sology.eu
