
require "crystal-on-rails/amethyst"

class WorldController < Base::Controller
  actions :hello

  def hello
    @name = "World"
    respond_to do |format|
      format.html { "hello" }
    end
  end
end

class HelloWorldApp < Base::App
  routes.draw do
    all "/",      "world#hello"
    get "/hello", "world#hello"
    register WorldController
  end
end

app = HelloWorldApp.new
app.serve
