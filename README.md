# Roda::Bin

Roda::Bin adds a bin/roda command line executable to run a simple development
server that automatically reloads on changes to the project file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roda-bin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roda-bin

If you're working on a BSD Unix system, add this to the Gemfile:

```ruby
require 'rbconfig'
if RbConfig::CONFIG['target_os'] =~ /(?i-mx:bsd|dragonfly)/
  gem 'rb-kqueue', '>= 0.2'
end
```

## Usage

In a terminal, run this command:

    $ roda server

It will tell you what address to load in your browser, and how to kill the
daemon:

    Listening on 0.0.0.0:8080, CTRL+C to stop

## Contributing

1. Fork it ( https://github.com/[my-github-username]/roda-bin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
