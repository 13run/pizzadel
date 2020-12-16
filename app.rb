# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'pizzashop.db'}

before do
	@products = Product.all
end

def get_order_list order_list
	order_list = order_list.split(/,/)
	products = []
	orders_list = order_list.map{|order| order.delete('product_').split('=')}
	
	orders_list.each do |order_item|
		products_item = []
		product = Product.find(order_item[0].to_i)
		count = order_item[1].to_i
		products.push(products_item = [product, count])
	end
	products

end

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
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

	@cart_list = get_order_list @orders_list
	
	erb :cart
end

post '/place_order' do
	@order = Order.new params[:order]

	@order.save

	@cart_list = get_order_list @order.order

	erb :order_placed
end
