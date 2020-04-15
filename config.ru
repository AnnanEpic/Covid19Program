# Encoding: utf-8
require 'rubygems'
require 'bundler'

Bundler.require

require 'sinatra'
require 'mongoid'
require 'roar/json/hal'
require 'rack/conneg'

configure do
  Mongoid.load!("config/mongoid.yml", settings.environment)
  set :server, :puma # default to puma for performance
end