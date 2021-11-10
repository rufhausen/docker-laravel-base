# Laravel Docker Base (for local projects)


Designed to be a starting point for Docker environments on local machines. 

### Included Services
- PHP 7.4
- MariaDB 10.4
- Nginx
- Redis

## Installation
Copy the environment variables in .env.example into your .env file. Customize as needed noting that all values defined need to be unique for each project.

## Notes
- MySQL data files are stored on the local file system, not in Docker shared data under docker/mysql/data. Doing so *might* make it faster on MacOS and allows you to reset Docker shared data without losing your database data.
- The `./docker-reboot` script includes `--scale blackfire=0`. There is no Blackfire container included, but if there were, this would prevent blackfire from spinning up by default. Might be useful for a container you want to add, but not run automatically.
- If you use VS Code, you can use the following to configure Xdebug:
[tasks.json](https://gist.github.com/rufhausen/3a7f3167f0041e11a4887176c8a450b9)
[launch.json](https://gist.github.com/rufhausen/f3461d23e3573fdc896e8e316c78aaca)
- If you want to run PHPUnit tests with xDebug, and you have some time to kill (it's faster with a local version of PHP), you can run: `docker-compose exec php php -d memory_limit=-1 -c ./docker/php/xdebug.ini vendor/bin/phpunit`
