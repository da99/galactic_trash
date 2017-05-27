
require "route"
class WebServer
  include Route
  @route_handler = RouteHandler.new

  def initialize
    draw(@route_handler) do # Draw routes
      get("/", API.new do |context|
        context.response.print "Hello route.cr\n"
        context # returning context
      end)
    end
  end # === def initialize

  def run
    server = HTTP::Server.new(3000, @route_handler) # Set RouteHandler to your server
    server.listen
  end
end # === class WebServer

web_server = WebServer.new
web_server.run
    
