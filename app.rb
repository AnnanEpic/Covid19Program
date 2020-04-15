# Encoding: utf-8
require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'
require 'mongoid'
require 'roar/json/hal'
require 'rack/conneg'
require './routes/routes.rb'
require './models/user.rb'


Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

use(Rack::Conneg) { |conneg|
  conneg.set :accept_all_extensions, false
  conneg.set :fallback, :json
  conneg.provide([:json])
}

before do
  if negotiated?
    content_type negotiated_type
  end
end
