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
	orders_list = params[:orders_list].split(/,/)

	
	
		products = []
		orders_list = orders_list.map{|order| order.delete('product_').split('=')}
		
		orders_list.each do |order_item|
			products_item = []
			product = Product.find(order_item[0].to_i)
			count = order_item[1].to_i
			products.push(products_item = [product, count])
		end
	
		
	
	

	@cart_list = products
	
	erb :cart
end

