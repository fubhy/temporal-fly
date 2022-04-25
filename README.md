NOTE: For production, you should probably manually create & seed the databases instead of using the
`auto-setup` temporal docker images with the postgres admin user.

```bash
# Create postgres instance and store the db credentials (choose scale & region according to your needs)
fly postgres create

# Create apps
fly app create my-temporal
fly app create my-temporal-ui
fly app create my-temporal-es

# Set the db credentials for temporal as a secret.
fly secrets set -a my-temporal POSTGRES_USER=<USERNAME> POSTGRES_PWD=<PASSWORD>

# Create volume for elasticsearch data
fly volumes create data --size 40 --app my-temporal-es

# Deploy apps (choose scale & region according to your needs)
fly deploy --remote-only --config fly.elasticsearch.toml
fly deploy --remote-only --config fly.temporal.toml
fly deploy --remote-only --config fly.ui.toml

```
