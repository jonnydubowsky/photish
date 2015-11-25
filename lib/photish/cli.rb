require 'thor'
require 'photish/command/generation'
require 'photish/command/host'
require 'photish/command/init'

module Photish
  class CLI < Thor
    package_name "Photish"

    desc "generate", "Generates the gallery static site"
    def generate
      Command::Generation.new(options).execute
    end

    desc "host", "Serves the HTML on a HTTP server"
    def host
      Command::Host.new(options).execute
    end

    desc "init", "Creates a basic Photish site sctructure"
    def init
      Command::Init.new(options).execute
    end
  end
end

