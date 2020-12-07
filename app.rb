# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'pizzashop.db'}

before do
	@products = Product.all
end

class Product < ActiveRecord::Base
end


get '/' do
	erb :index
end

get '/about' do
	erb :index
end
