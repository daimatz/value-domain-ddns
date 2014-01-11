# Value::Domain::Ddns

value-domain ddns script

## Installation

```sh
gem install value-domain-ddns
```

## Usage

write `config.json` to settings and put it into current directory.

```json
{
  "domain": "example.com",
  "password": "example-password",
  "hostname": "example"
}
```

and then execute

```sh
value-domain-ddns sync
```

to execute syncing.

if `--config` option passed, read it.
`--domain`, `--password`, `--hostname`, `--ip` are also available.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
