# Cupid gem — Create, organize and send emails through Exact Target

Send love, not war. This version of cupid can only work with ET SOAP API with s4.

Sponsored by Evil Martians <http://evilmartians.com>

## Usage

Add cupid initializer to your config/initializers and now there only two parameters to configure:

``` ruby
Cupid.configure do |config|
  config.username = 'username'
  config.password = 'password'
  config.account  = 'default_client_id'
end
```

After that you can create Cupid::Session object and do some stuff through it:

``` ruby
# Creating session
et_translator = Cupid::Session.new

# Retrieving folders for not default account (your_account_id can be nil - default account on ET)
folders = et_translator.retrieve_email_folders

# Retrieving email copies for not default account (your_account_id can be nil - default account on ET)
copies = et_translator.retrieve_email_copies(name)

# Retrieving emails from list for not default account (your_account_id can be nil - default account on ET)
copies = et_translator.retrieve_emails_from_list(list_id)

# Creating new folder
# not required fields for folder: description, content_type, is_active, is_editable, allow_children
new_folder_id = et_translator.create_folder('title', :parent => parent_directory_id)

# Creating folders
# not required fields for folders: description, content_type, is_active, is_editable, allow_children
new_folder_ids = et_translator.create_folders(['title', 'title2'], :parent => parent_directory_id)

# Creating new email
# not required fields for email: email_type, is_html_paste, character_set, name, description, category_id
new_email_id = et_translator.create_email('subject', 'body')

# Creating emails
# not required fields for emails: email_type, is_html_paste, character_set, name, description, category_id
new_email_ids = et_translator.create_emails({'subject' => 'body', 'subject2' => 'body2'})

# User object:
{
  :email => 'email@email.com',
  :lists => [list_id1, list_id2...],
  :first_name => 'Name',
  :last_name => 'Lastname'
}

# Creating new subscriber
# not required fields for subscriber: first_name, last_name, client_id
new_subscriber_id = et_translator.create_subscriber(user_object)

# Creating subscribers
# not required fields for subscriber: first_name, last_name, client_id
new_subscriber_ids = et_translator.create_subscribers([user_object1, user_object2...])

# Send email to list
# not required fields for send: account
send_tracking_id = et_translator.send_email_to_list(email_id, list_id)

# Send emails to lists
# not required fields for send: account
send_tracking_ids = et_translator.send_emails_to_lists({'email_id' => 'list_id','email_id' => 'list_id'...})
```

## Installation

Puts this line into `Gemfile` then run `$ bundle`:

``` ruby
gem 'cupid', '0.2.4'
```

Or if you are old-school Rails 2 developer put this into `config/environment.rb` and run `$ rake gems:install`:

``` ruby
config.gem 'cupid', :version => '0.2.4'
```

Or manually install cupid gem: `$ gem install cupid`

## Contributors

* @gazay

## License

The MIT License

Copyright (c) 2011 Alexey Gaziev <gazay@evilmartians.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
