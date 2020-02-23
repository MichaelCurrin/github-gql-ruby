# Github GraphQL Ruby
> Simple proof of concept to request the Github GraphQL API using Ruby

[![Made with Ruby](https://img.shields.io/badge/Made%20with-Ruby-blue.svg)](https://www.ruby-lang.org)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/github-gql-ruby.svg)](https://GitHub.com/MichaelCurrin/github-gql-ruby/tags/)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/gihhub-gql-ruby/blob/master/LICENSE)

This project is intended for anyone who wants to learn how to get data from any GraphQL API, or actually get and use Github data from the API. No knowledge of Ruby, GraphQL or Github API is needed to run this project.

The logic here is very light - the main script does a POST request using the [Faraday](https://lostisland.github.io/faraday/) gem against the [Github GraphQL API](https://developer.github.com/v4/). This request could be adjusted to do GQL requests on other APIs or do lookup repos for users other than the authenticating user.

For more advanced API requests, you could use Ruby gems which are built for GraphQL. They might handle things like schema validation and error handling but I have not used them.

- [github/graphql-client](https://github.com/github/graphql-client) - There is a nice example in their docs using the Star Wars API. Note this gem requires Ruby `2.4.4` or higher.
- [rmosolgo/graphql-ruby](https://github.com/rmosolgo/graphql-ruby)

See also my Github GraphQL project written in Python - [MichaelCurrin/github-graphql-tool](https://github.com/MichaelCurrin/github-graphql-tool).

This project is the first step in a larger goal to fetch and transform Github repo data for myself and use it in Jekyll static site using a plugin (which has to be written in Ruby). Though, that is not in the scope of this repo.


## Requirements

- Github account
- Github API access token


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

Login to your Github account.

Go to your account settings then Personal Access Tokens. Or go to this link - [github.com/settings/tokens](https://github.com/settings/tokens).

Create a Github developer token with read access to your details such as your user and repos.

Copy the token value. :warning: **Do not share this with anyone and do not put it in version control**

Create a local _dotenv_ file in this project as below but replace the sample value below with your own token's value. This file will be ignored as it appears in the [.gitignore](/.gitignore) file.

e.g.

```sh
$ echo "ACCESS_TOKEN=123456" > .env
```

## Usage

Navigate to the project root.

Set the token in the current terminal.

```sh
$ export $(cat .env | xargs)
```

Check that is set.

```sh
$ echo $ACCESS_TOKEN
123456
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

To get different data, update the query in the `.gql` file and rerun the command above. The output will just be printed as pretty JSON.

## Future development

This project could also be refactored to the request script structure be more reusable.

Also rather than using a hardcoded query, this application could read in a queries from files and to allow a choice.

This project is a demo and proof of concept, so it could stay as is.
