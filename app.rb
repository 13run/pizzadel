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

get '/product/:id' do
	@product = Product.find(params[:id])
	erb :product
end

post '/cart' do
	@orders_list = params[:orders_list]
	@orders_list = @orders_list.strip.split(',').map{|order| order.delete('product_').split('=')}
	
	erb :cart
end
