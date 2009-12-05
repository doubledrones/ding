require 'rubygems'

if ENV['RACK_ENV'] == 'development'
  # This makes sure the bundled gems are in our $LOAD_PATH
  require File.expand_path(File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment'))

  # This actually requires the bundled gems
  Bundler.require_env
end

require 'sinatra'

require 'lib/ding'
require 'rack_hoptoad'

use Rack::HoptoadNotifier, '276a4c0a1715e7a29f976677bee2beff'

Ding.set(:environment, (ENV['RACK_ENV'] || :development))
run Ding

