# dorkbot

A [Lita.io](https://www.lita.io/) bot for New Dork City Slack community.

Read more on [Slack bots](https://api.slack.com/bot-users).

## Develop locally

Create an `.envrc` file with override environment variables, like:

    LITA_SLACK_TOKEN=abcdefghijklmnop
    LITA_ADAPTER=shell # to use the local shell adapter instead of Slack

Uses [`docker-compose`](https://docs.docker.com/compose/) with VirtualBox:

    docker-compose build
    docker-compose run --rm lita lita start

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

The `brain` container persists to the Docker host in `/opt/dorkbot/data`.

## Deployment

TBD

## License

WTFPL. See [LICENSE](LICENSE) for full text.
