# dorkbot

A [Lita.io](https://www.lita.io/) bot for New Dork City Slack community.

Read more on [Slack bots](https://api.slack.com/bot-users).

## Develop locally

Create an `.env` file with override environment variables, like:

    LITA_SLACK_TOKEN=abcdefghijklmnop
    LITA_ADAPTER=shell # to use the local shell adapter instead of Slack

See `lita_config.rb` for any more variables you can set.

Uses [`docker-compose`](https://docs.docker.com/compose/) with VirtualBox:

    docker-compose build
    docker-compose run --rm lita

    # Cleanup
    docker-compose stop
    docker-compose rm

See `docker-compose.yml` for details.

**Note**: Cannot run `docker-compose up` until
https://github.com/docker/compose/pull/1374 released.

The `volumes` statement in the `docker-compose.yml` will mount all the files in
the root directory.
Assists with running the lita container without requiring a full rebuild while
working on configs or custom extensions. See `.dockerignore` for exclusions.

The `brain` container persists to the Docker host.

## Deployment

The project deploys to Heroku automatically on merges to `master` branch.
This has some caveats - such as using the heroku Redis store has no persistence,
and that I've used the Heroku scheduler to keep the bot online during "business hours".

A future change will be to migrate the project to an always-on service with a persistent
data layer.

## Other

- Run bot in interactive bash shell and override an environment variable:

      docker-compose run --rm --entrypoint /bin/bash -e LITA_ADAPTER=shell lita

## License

WTFPL. See [LICENSE](LICENSE) for full text.
