require './config/environment'
require 'rack/static'

use Rack::Static, urls: ['/assets'], root: 'public'
run Lotus::Container.new
