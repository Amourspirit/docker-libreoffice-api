# LibreOffice-API Docker Image

This Version is 7.5 of LibreOffice.

A LibreOffice API docker image

On DockerHub: [dockdock/libreoffice-api](https://hub.docker.com/r/dockdock/libreoffice-api)


### Timezone

We add "UTC" timezone

### Base user

We use same user in all our applications

| key      | value     |
|----------|-----------|
| username | dockdock  |
| uid      | 1000      |
| gid      | 1000      |

##  Apps

This version of LibreOffice API contains:

- Writer
- Calc

## Ports

This version of LibreOffice API expose the port 2002

## Tags

- LO-7.5

## Build

```bash
docker build -t dockdock/libreoffice-api:LO-7.5 .
```
