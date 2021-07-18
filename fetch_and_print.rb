# Fetch and print.
#
# Do GraphQL query and print the pretty results to the console.

require_relative 'request.rb'


data = Request.query
# puts "Login: #{data['viewer']['login']}"

# puts 'Repositories:'
# for repo in data['viewer']['repositories']['nodes'] do
#   puts "  Name: #{repo['name']}"
#   puts "  Description: #{repo['description']}"
#   puts "  Stars: #{repo['stargazers']['totalCount']}"
#   puts
# end

viewer = data['viewer']

topics = {}
repos = viewer['repositories']['nodes']
for repo in repos do
  repo_topics = repo['repositoryTopics']['nodes']
  for topic in repo_topics do
    puts topic
  end
end
