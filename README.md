# Rtftopdf

Converts rtf strings to pdf output using unrtf and wkhtmltopdf.


## Installation

    brew install unrtf
    brew install wkhtmltopdf

Add this line to your application's Gemfile:

    gem 'rtftopdf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rtftopdf

## Usage

````ruby
RTFtoPDF.to_pdf("some rtf input")
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
