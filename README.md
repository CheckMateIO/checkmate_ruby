checkmate-ruby
==============


# Checkmate::Client

A Ruby wrapper for the CheckMate REST API.

## Installation

Add this line to your application's Gemfile:

    gem 'checkmate_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install checkmate_ruby

## Usage

You will need your Checkmate API private key to use the client.

First, set up your client with your API key:

    Checkmate::Client.configure do |config|
      config.private_key = YOUR_KEY_HERE
    end

    client = Checkmate::Client.new()

After that you can use any of the public API methods for Checkmate.  Note that you
can also specify an alternative API url if you need to using the :api_url config
key.

### Fetch a property

You can query the API for a property. All of the fields referenced in the query are required.

    client.get_property({:name => "Hotel Kabuki", :phone => "14159223200", :address => {:street => "1625 Post St", :city => "San Francisco", :region => "CA", :postal_code => "94115"}}) 

### List reservations

You can query the API for all your reservations or the reservations for a specific property.

    client.list_reservations() #all reservations
    client.list_reservations({:confirmation_num => "12349asdf"}) #reservations with that confirmation number
    client.list_reservations({:property_id => 13434543}) #reservations for that property

### Show reservation

You can request a specific reservation from the Checkmate API.

    client.show_reservation(123452) #reservation with id 123452  
