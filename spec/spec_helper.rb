$LOAD_PATH.unshift(File.expand_path('./app'))
ENV['RACK_ENV'] = 'test'
require 'config'
require 'rack/test'