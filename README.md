# Github GraphQL Ruby
> Request the Github GraphQL API using Ruby

This repo is very light - it does a POST request using the [Faraday](https://lostisland.github.io/faraday/) gem against the [Github GraphQL API](https://developer.github.com/v4/). This could be adjusted to do GQL requests on other APIs.

For more advanced cases, you can use Ruby gems which are built for GraphQL. They might handle things like schema validation and error handling but I have not used them.

- [github/graphql-client](https://github.com/github/graphql-client) - There is a nice example in their docs using the Star Wars API. Note this gem requires Ruby 2.4.4 or higher.
- [rmosolgo/graphql-ruby](https://github.com/rmosolgo/graphql-ruby)


## Install

Clone the repo.

Install Ruby and Bundler.

Install dependencies.

```sh
$ make install
```

Configure - create an unversioned _dotenv_ file with your Github API dev token.

e.g.

```sh
$ echo "ACCESS_TOKEN=123456" > .env
```

## Usage

Set the token in the current terminal.

```sh
$ make token
```

Do a query.

```sh
$ bundle exec ruby request.rb
```

## Future development

This project could also be refactored to the request script structure be more reusable.

Also rather than using a hardcoded query, this application could read in a queries from files and to allow a choice.

This project is a demo and proof of concept, so it could stay as is.
