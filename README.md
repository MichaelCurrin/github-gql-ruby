# Github GraphQL Ruby
> Simple proof of concept to request the Github GraphQL API using Ruby

[![Made with Ruby](https://img.shields.io/badge/Made%20with-Ruby-blue.svg)](https://www.ruby-lang.org)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/gihhub-gql-ruby/blob/master/LICENSE)

This repo is very light - it does a POST request using the [Faraday](https://lostisland.github.io/faraday/) gem against the [Github GraphQL API](https://developer.github.com/v4/). This could be adjusted to do GQL requests on other APIs.

For more advanced cases, you can use Ruby gems which are built for GraphQL. They might handle things like schema validation and error handling but I have not used them.

- [github/graphql-client](https://github.com/github/graphql-client) - There is a nice example in their docs using the Star Wars API. Note this gem requires Ruby `2.4.4` or higher.
- [rmosolgo/graphql-ruby](https://github.com/rmosolgo/graphql-ruby)

See also my Github GraphQL project written in Python - [MichaelCurrin/github-graphql-tool](https://github.com/MichaelCurrin/github-graphql-tool).


## Install

### System dependencies

Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems) using a command appropriate for your OS. Then you can use the `gem` command in the next step.

Install [Bundler](https://bundler.io/) globally using the command below.

```bash
$ gem install bundler
```

_Bundler_ is used to manage Ruby gem dependencies in an isolated directory, to preserve your global gems.


### Project dependencies.

Install gems.

```bash
$ make install
```

Run this command in future to upgrade to the latest gems.

```bash
$ make upgrade
```

### Config

Login to Github.

Go to your account settings then Personal Access Tokens. Or go to this link - [github.com/settings/tokens](https://github.com/settings/tokens).

Create a Github developer token with read access to your details such as your user and repos.

Copy the token value. :warning: **Do not share with with anyone and do not put it in version control**

Create a local _dotenv_ file in this project as below but replace the sample value below with your own token's value. This file will be ignored as it appears in the [.gitignore](/.gitignore) file.

e.g.

```sh
$ echo "ACCESS_TOKEN=123456" > .env
```

## Usage

Navigate to the project root.

Set the token in the current terminal.

```sh
$ make token
```

Do a query.

```sh
$ make run
```

Sample output:

```
bundle exec ruby request.rb
Do POST request
Status: 200
{
  "viewer": {
    "login": "MichaelCurrin",
    "repositories": {
      "nodes": [
        {
          "name": "uni-cron",
          "description": "Easy scheduler to tasks run exactly once per day and will retry at intervals until they pass :repeat_one::hourglass_flowing_sand::unicorn:",
          "stargazers": {
            "totalCount": 3
          }
        },
        {
          "name": "history-report",
          "description": "Create page and domain CSV reports from your Chrome browsing history",
          "stargazers": {
            "totalCount": 2
          }
        },
        {
          "name": "twitterverse",
          "description": "Store and report on Twitter conversations, from tweets to trending topics",
          "stargazers": {
            "totalCount": 2
          }
        }
      ]
    }
  }
}
```

## Future development

This project could also be refactored to the request script structure be more reusable.

Also rather than using a hardcoded query, this application could read in a queries from files and to allow a choice.

This project is a demo and proof of concept, so it could stay as is.
