# Moodle Dev Environment in Docker

## Installation

Take environment up with `docker-compose up -d`. After that if running first time, run `docker exec -it moodle install_all`. That will initialize Moodle environment and test environments. Afterwards you should be able to access Moodle from `http://localhost:8000` with username `admin` and password `admin`.

## Commands

Running any commands are easy as `docker exec -it moodle command`

- install Grunt (done in Dockerfile build) `install_grunt`
- install Moodle first time and init Behat and PHPUnit `install_all`
- install Moodle first time `install_moodle` and initialize with username `admin` and password `admin`
- init Behat tests `init_behat`
- init PHPUnit tests `init_phpunit`
- run Behat tests `behat tag_name`. Give tag name without `@` in front of the tag. It runs with profile `audiochrome` so all Mediadevices are faked out to be working.
- run PHPUnit tests `phpunit group_name`.
- run Grunt for module `grunta`
- upgrade Moodle and activity after for example DB changes `upgrade`