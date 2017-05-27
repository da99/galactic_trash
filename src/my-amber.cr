
# Location for your initialization code
# {YourApp}/src/config/app.cr

# The config file that Amber generates, web/router.cr, will look something like
# this one:

# The first line requires the framework library.
require "amber"

# This line simply makes a Amber Server instance that will be use for your
# entire application

class HelloController < Amber::Controller::Base
  def hello
    "hello"
  end

  def world
    "Hello World"
  end

  def now
    "hello now"
    # render "template_demo.slang" # renders views/hello/template_demo.slang with layout views/layouts/application.slang
  end
end

MyAwesomeApp = Amber::Server.instance

# This line represents how you will define your application configuration.
MyAwesomeApp.config do
  # Server options
  app_path = __FILE__ # Do not change unless you understand what you are doing.
  name = "Hello World App" # A descriptive name for your app
  port = 8080 # Port you wish your app to run
  env = "development".colorize(:yellow).to_s
  log = ::Logger.new(STDOUT)
  log.level = ::Logger::INFO

  # Every Amber application needs to define a pipeline set of pipes
  # each pipeline allow a set of middleware transformations to be applied to
  # different sets of route, this give you granular control and explicitness
  # of which transformation to run for each of the app requests.

  # All api scoped routes will run these transformations
  pipeline :api do
    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::Params.instance
    plug Amber::Pipe::Logger.instance
    plug Amber::Pipe::Error.instance
    plug Amber::Pipe::Session.instance
  end

  # All web content will run this pipeline
  pipeline :web do
    plug Amber::Pipe::Params.instance
    plug Amber::Pipe::Logger.instance
    plug Amber::Pipe::Error.instance
    plug Amber::Pipe::Session.instance
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::Params.instance
    plug Amber::Pipe::Logger.instance
    plug Amber::Pipe::Error.instance
    plug Amber::Pipe::Session.instance
  end

  # This is how you define the routes for your application
  # HTTP methods supported [GET, PATCH, POST, PUT, DELETE, OPTIONS]
  # Read more about HTTP methods here
  # (HTTP METHODS)[https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html]
  routes do
    # Each route is defined as follow
    # verb, resources : String, controller : Symbol, action : Symbol,
    # pipeline : Symbol
    # get "/", :HelloController, :world, :api
    # get "/hello", :hello, :world, :api
    # get "/hello/:planet", :hello, :world, :api
    get "/hello/now", HelloController, :now, :web
    get "/hello/now/:name", HelloController, :now, :web
  end
end

# Finally this is how you will bootup the server.
MyAwesomeApp.run
