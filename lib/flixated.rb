$LOAD_PATH << File.dirname(__FILE__) unless $LOAD_PATH.include?(File.dirname(__FILE__))

require 'oauth'
require 'json'
require 'flixated/client'

module Flixated
  VERSION = '0.0.1'
end