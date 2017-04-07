
require "roda"

class App < Roda
  route do |r|
    r.root do
      "Welcome to the past."
    end
  end # === route do |r|
end # === class App
