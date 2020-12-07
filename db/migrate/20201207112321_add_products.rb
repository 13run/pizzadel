class AddProducts < ActiveRecord::Migration[6.0]
  def change
    Product.create title: '4cheez',
                   description: 'this is pizza with 4 cheese',
                   price: 350, size: 30,
                   spicy?: false, best_offer?: true,
                   vegetarian?: true, path_to_img: '/img/4cheez.png'

    Product.create title: 'margarita',
                   description: 'this is pizza margarita',
                   price: 270, size: 30,
                   spicy?: false, best_offer?: true,
                   vegetarian?: true, path_to_img: '/img/margarita.png'

    Product.create title: '4cheez',
                   description: 'this is pepperoni pizza',
                   price: 330, size: 30,
                   spicy?: false, best_offer?: true,
                   vegetarian?: true, path_to_img: '/img/pepperoni.png'

 
  end

end
