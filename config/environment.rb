#require_relative './key.rb'
require 'pry'
require 'json'
require 'open-uri'
require_relative "../key.rb"
require 'forecast_io'
require_relative '../lib/current'
require_relative '../lib/home'
require_relative '../lib/forecast'

  Home.new