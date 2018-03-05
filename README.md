# MyParcel Ruby gem

MyParcel Ruby gem provides a wrapper for [MyParcel API](https://myparcelnl.github.io/api/)

This repository is a fork of
[paypronl/myparcel](https://github.com/paypronl/myparcel). The original
repository is no longer maintained.

Note: the `myparcel` gem is owned by the original authors and is *not* updated
from changes in this repository.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'myparcel', git: 'https://github.com/bjpbakker/myparcel.git', branch: 'next'
```

And then execute:

    $ bundle

## Usage

### Client

```ruby
client = Myparcel.client('your-api-key')
```

### Shipments

Getting shipments by id:

```ruby
client.shipments.find shipment_ids: [1, 2, 3]
```

Getting all shipments:

```ruby
client.shipments.all
# or
client.shipments.find
```

Creating shipments:

```ruby
shipment = {
  recipient: {
    cc: 'NL',
    postal_code: '9999XX',
    city: 'Amsterdam',
    street: 'Hoofdstraat',
    number: '1',
    person: 'John Doe'
  },
  carrier: 1,
  options: {
    package_type: 1
  },
  status: 1
}
client.shipments.create shipments: [shipment]
```

Deleting shipments (at least one ID is required):

```ruby
client.shipments.delete shipment_ids: [1, 2, 3]
```

### Delivery options

Get possible delivery options for an address:

```ruby
client.delivery_options.find cc: 'NL', postal_code: '2131bc', number: 679, carrier: 'postnl'
```

### Track and Trace

Getting Track&Trace codes by shipment IDs:

```ruby
client.tracktraces.find shipment_ids: [1, 2, 3]
```

### Webhook subscriptions

Creating a webhook:

```ruby
webhook = {
  hook: "shipment_status_change",
  url: "https://seoshop.nl/myparcel/notifications"
}
client.webhooks.create subscriptions: [webhook]
```

Getting webhook subscriptions (at least one subscription ID is required):

```ruby
client.webhooks.find subscription_ids: [1, 2, 3]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bjpbakker/myparcel. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
