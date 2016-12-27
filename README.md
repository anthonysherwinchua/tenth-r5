# Tenthstory's website

## MAIN FEATURES ##

## System Dependencies

The following are needed by this project:

* [PostgreSQL](http://www.postgresql.org/) at least version 9.4

## Getting Started

Clone this repository and bundle.

    git clone git@github.com:anthonysherwinchua/fonzyandkat.git
    cd fonzyandkat
    bundle install

Create a `database.yml` file from the sample and modify if necessary.
The defaults should be fine.

    cp config/database.yml.sample config/database.yml

Create a `.env` file from the sample so [dotenv](https://github.com/bkeepers/dotenv) can set the required environment variables.
Please obtain any missing values from the project administrator.

    cp .env.sample .env

Create and initialize the database.

    rake db:create db:migrate db:seed

Start the application server.

    rails server

Access the application at [http://localhost:3000/](http://localhost:3000/).

## Testing

Run the test suite with [RSpec](https://github.com/rspec/rspec-rails).

    rspec spec/

## Coding Style

We setup some static analyzers to ensure our codes clean and readable. To run all linters, do `rake linter:all`, or individually as follow:

1. Ruby - [Rubocop](https://github.com/bbatsov/rubocop)

    ```bash
    # Run rubocop
    bundle exec rubocop
    ```

2. CoffeeScript - [CoffeeLint](http://www.coffeelint.org)

    ```bash
    # Run coffeelint
    coffeelint .
    ```

3. Slim - [Slim-Lint](https://github.com/sds/slim-lint)

    ```bash
    # Run slim-lint
    slim-lint .
    ```

4. SCSS - [SCSS-Lint](https://github.com/brigade/scss-lint)

    ```bash
    # Run scss-lint
    scss-lint
    ```

## Branch Policy

Local development branch naming:

* `feature/<branch_name>` for substantial new feature or function
* `enhance/<branch_name>` for minor feature or function enhancement
* `bugfix/<branch_name>` for bug fixes

* `development` for staging; branch out from this to create and/or enhance existing feature(s);
* `master` for production only

## Deployment

The application is deployed to [Heroku](https://www.heroku.com/) at:

* [Production](https://www.tenthstory.com/)
* [Staging](https://staging.tenthstory.com/)
