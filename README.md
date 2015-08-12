# Oishinbo

## Example

```
git clone git@github.com:sota1235/Oishinbo.git

cd Oishinbo

bundle install --path vendor/bundle
```

## Migration

```
# Migration
bundle exec db:migrate:status
bundle exec db:migrate

# add seed data
bundle exec db:seed

# Confirmation
bundle exec rackup -o 0.0.0.0

# Access
http://{localhost or IP}/test
```
