# Getting Started

Follow these steps to set up and work with the project:

## 1. Build and Boot the Container

Build the Docker container:

    docker compose build

Start the container in detached mode:

    docker compose up -d

## 2. Install Composer Dependencies

Install the required Composer dependencies:

    docker compose exec php composer install

## 3. Specify User and Group IDs (if needed)

If your default `USER_ID` and `GROUP_ID` differ from `1000` (commonly used by Docker), create an `.env` file in the project root with the following contents:

    USER_ID=1000
    GROUP_ID=1000

This ensures proper permissions inside the container. Rebuild the container if you make changes to the `.env` file:

    docker compose build
    docker compose up -d

## 4. Generate Code Coverage Report

To create a coverage report using PHPUnit (where `php` is the service name), run:

    docker compose exec php ./vendor/bin/phpunit --coverage-html coverage-report

The generated coverage report will be available in the `coverage-report` directory.

## 5. Update Composer Autoload Files

If you make changes to the `composer.json` or `autoload` configuration, update the Composer autoload files:

    docker compose exec php composer dump-autoload

## Notes

- Ensure you have Docker and Docker Compose installed on your system before proceeding.
- Replace `php` with your actual service name if it's different in your `docker-compose.yml`.
