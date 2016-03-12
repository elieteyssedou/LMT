# LMT
![LMT Banner](assets/LMT-banner.jpg)

LiveMentorTest (LMT) is a script/CLI able to convert a JSON file to a CSV file while following a specific syntax (for the field names or the field values).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lmt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lmt

## Usage

You can run the CLI to use LMT (or using directly the different classes defined in this gem).

To run the CLI:
	
	$ bundle exec lmt

To run a conversion:
	
	$ bundle exec lmt convert FILE_NAME {OPTIONS}

To run a fonctionnal test: (file comparison)
	
	$ bundle exec lmt test

You can check the Yard Doc by doing the following:
	
	$ yard server
	
>Then go to [http://localhost:8808](http://localhost:8808)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

