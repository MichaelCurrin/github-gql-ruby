# Request application.
#
# Do a request to the GraphQL, handle errors and pretty print the response data.
require 'json'
require 'faraday'


API_URL = 'https://api.github.com/graphql'

TOKEN = ENV['ACCESS_TOKEN']
unless TOKEN
  raise 'Env variable ACCESS_TOKEN must be set'
end
HEADERS = {
  'Authorization': "token #{TOKEN}",
  'Content-Type': "application/json",
}

QUERY_PATH = 'query.gql'
QUERY = File.open(QUERY_PATH).read


def do_post(url, payload)
  puts "Do POST request"

  resp = Faraday.post(
    url,
    payload.to_json,
    'Content-Type'=> "application/json",
    'Authorization' => "token #{TOKEN}",
  )
  puts "Status: #{resp.status}"
  if resp.status != 200
    puts "Body:"
    puts resp.body
    raise "Request status: #{resp.status}"
  end
  resp_data = JSON.parse resp.body
end


def query_gql()
  query_payload = {'query': QUERY}
  results = do_post API_URL, query_payload

  errors = results['errors']
  if errors
    puts 'Errors on response:'
    puts JSON.pretty_generate errors
    raise "Request error!"
  end

  results['data']
end


data = query_gql()
puts JSON.pretty_generate data
