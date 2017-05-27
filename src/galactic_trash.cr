# require "./galactic_trash/*"
require "kemal"
require "mu-html"
require "json"

serve_static false

get "/" do
  "The home page."
end

get "/json" do | env |
  env.response.content_type = "application/json"
  {name: "World", type: "Hello"}.to_json
end

get "/hello" do
  "Hello, #{Mu_Html}!"
end

Kemal.run
