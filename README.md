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

Uses [Tutum](https://www.tutum.co/) to deploy a container stack on a node.
See `tutum.yml` for details.

Post-deploy, a Trigger hook is manually set on the `dorkbot` service to redeploy
on a successful build from the [Docker Registry](https://registry.hub.docker.com/u/miketheman/dorkbot/builds_history/205292/).

The Registry will build the container with the new code, and trigger a WebHook
to Tutum to redeploy the running container.

## Other

- Download last-saved redis data

      tutum service run -n downloader -p 2222:22 -e AUTHORIZED_KEYS="$(cat ~/.ssh/id_rsa.pub)" --volumes-from brain tutum/ubuntu
      scp -r -P 2222 root@downloader-1.miketheman.cont.tutum.io:/data .

- Run bot in interactive bash shell and override an environment variable:

      docker-compose run --rm --entrypoint /bin/bash -e LITA_ADAPTER=shell lita

## License

WTFPL. See [LICENSE](LICENSE) for full text.
