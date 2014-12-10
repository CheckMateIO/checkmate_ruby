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

Refer to the [documentation] (https://partners-staging.checkmate.io/docs) for the final word on what's
required/optional for each call.

### Fetch a property

You can query the API for a property. All of the fields referenced in the query are required.

    client.get_property({:name => "Hotel Kabuki", :phone => "14159223200", \
        :address => {:street => "1625 Post St", :city => "San Francisco", :region => "CA", :postal_code => "94115"}})

### List reservations

You can query the API for all your reservations or the reservations for a specific property.

    # all reservations
    client.list_reservations()

    # reservations with a specific confirmation number
    client.list_reservations({:confirmation_num => "12349asdf"})

    # reservations for property with id 13434543
    client.list_reservations({:property_id => 13434543})

### Show reservation

You can request a specific reservation from the Checkmate API.

    # reservation with id 123452  
    client.show_reservation(123452)

### Create reservation

You can create a reservation in Checkmate using either an existing property id, or by
creating a new property within the request.

    # reservation under property 93
    client.create_reservation({:external_id => "someid123", :confirmation_number => "sdlfkjweo324", \
        :last_name => "smith", :email => "frank@smith.io", :start_on => "12/12/2016", :end_on => "12/14/2016"}, 93)

    # creating a new property
    client.create_reservation({:external_id => "someid123", :confirmation_number => "sdlfkjweo324", \
        :last_name => "smith", :email => "frank@smith.io", :start_on => "12/12/2016", :end_on => "12/14/2016", \
        :property => {:name => "New Hotel", :address => {:street => "123 Leaf Lane", :country_code => "US"}}})

    # or like this
    client.create_reservation({:external_id => "someid123", :confirmation_number => "sdlfkjweo324", \
        :last_name => "smith", :email => "frank@smith.io", :start_on => "12/12/2016", :end_on => "12/14/2016", \
        :property => {:name => "New Hotel", :full_address => "123 Leaf Lane, Blue City, FG, 12345, US"}})

### Update reservation

You can update an existing reservation in Checkmate using a reservation_id

    # reservation id 12345
    client.update_reservation(12345, {:first_name => "Bob", :room_code => "STDK"})

### Delete reservation

You can delete an existing reservation in Checkmate using a reservation_id

    # reservation id 12345
    client.delete_reservation(12345)

### Bulk create reservations

Each reservation follows the same format as a single reservation.

    client.bulk_create_reservations([ \
      {:external_id => "fdoo", :confirmation_number => "sdlfkjweo324", :last_name => "smith", :email => "f@b.io", \
       :start_on => "12/12/2016", :end_on => "12/14/2016", :property => {:name => "New Hotel", \
       :full_address => "487 Bryant St, San Francisco, CA 94105, US"}},
      {:external_id => "hfg34", :confirmation_number => "gjhhffgh456", :last_name => "brown", :email => "ff@b.io", \
       :start_on => "12/12/2015", :end_on => "12/14/2015", :property => {:name => "New Hotel", \
       :full_address => "487 Bryant St, San Francisco, CA 94105, US"}}])
