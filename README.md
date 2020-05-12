# 💎 Github GraphQL with Ruby
> Simple proof of concept to request the Github GraphQL API using Ruby

[![Made with Ruby](https://img.shields.io/badge/Made%20with-Ruby-blue.svg)](https://www.ruby-lang.org)
[![GitHub tag](https://img.shields.io/github/tag/MichaelCurrin/github-gql-ruby.svg)](https://GitHub.com/MichaelCurrin/github-gql-ruby/tags/)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/MichaelCurrin/gihhub-gql-ruby/blob/master/LICENSE)

This project was built as a step towards getting Github GraphQL data into a static site. Since that was achieved, this project serves as a reference on how that works in a simple form and as a reference for anyone who wants to learn how to get data from Github or any GraphQL API using Ruby.

The logic here is very light - the main script does a POST request using the [Faraday](https://lostisland.github.io/faraday/) gem against the [Github GraphQL API](https://developer.github.com/v4/). This project handles this usecase without a lot of code. The request could be adjusted to do GQL requests on other APIs or do lookup repos for users other than the authenticating user.


## 📝 Requirements

- Github account
- Github API access token
- _Ruby_
- _Bundler_

No prior knowledge of Ruby, GraphQL or Github API is needed to actually run this project.


## ⚒ Install

### System dependencies

Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems) using a command appropriate for your OS. Then you can use the `gem` command in the next step.

Install [Bundler](https://bundler.io/) globally using the command below.

```bash
$ gem install bundler
```

_Bundler_ is used to manage _Ruby_ gem dependencies in an isolated directory, to preserve your global gems.


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

## 🏋️‍♂️ Usage

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


## 🏗 Future development

This project could also be refactored to the request script structure be more reusable.

Also rather than using a hardcoded query, this application could read in a queries from files and to allow a choice.

This project is a demo and proof of concept, so it could stay as is.


## 🏘 Related projects

Links to projects about GraphQL or using Github data.

### Ruby

The _Faraday_ gem used in this project has been adapted for GQL. If you need a gem built for GQL requests, try one of these below. I assume they might do things like schema validation and error handling, but I have not used them before.

- GraphQL client
    - [k0kubun/github_api-v4-client](https://github.com/k0kubun/github_api-v4-client)
        - A client for **Github** API V4 (GraphQL).
    - [github/graphql-client](https://github.com/github/graphql-client) 
        - > A Ruby library for declaring, composing and executing GraphQL queries 
        - A **generic** client for GraphQL. There is a nice example in their docs using the Star Wars API. It can be adapted for Github API.
      - Note this gem requires Ruby `2.4.4` or higher.
- GraphQL server
    - [rmosolgo/graphql-ruby](https://github.com/rmosolgo/graphql-ruby)
        - > Ruby implementation of GraphQL
        - This seems to be a server.
    - [ruby_graphql_api](https://github.com/michaeltelford/ruby_graphql_api)
        - GraphQL server built on Ruby.
    - Github REST API client
        - [octokit/octokit.rb](https://github.com/octokit/octokit.rb)
            - Toolkit for Ruby for Github API. This uses the REST API.

### Python

- [MichaelCurrin/github-graphql-tool](https://github.com/MichaelCurrin/github-graphql-tool) - my Github GraphQL project which was written in Python. Unfortunately Python does not work as part of the flow when building a Jekyll site. So that is why I started this project.


### Static sites

- [jekyll-github-metadata](https://github.com/jekyll/github-metadata) - If you want to get data about your own Github repos and use that for your Jekyll site as dev portfolio without much code, you might find that this plugin satisfies your needs. It may not have all the data you are looking for though - so GraphQL approach is more flexible. Note that plugin might actually use the REST API.
-  [github/personal-website](https://github.com/github/personal-website) - Github's quickstart dev portfolio is a good example of using Github data in a static site through the `jekyll-github-metadata` plugin.
- [MichaelCurrin/my-github-projects](https://github.com/MichaelCurrin/my-github-projects) - A project to fetch my Github repo data, group repos by label and then use the result in a Jekyll static site as dev portfolio. This Github GQL Ruby was the proof of concept I did before doing the dev portfolio. Although Ruby is not my main language, Jekyll plugins are in Ruby, so I had to learn some Ruby in order to pull the data into a Jekyll project.

