function addToCart(id) {
    let key = `product_${id}`;
    let i = window.localStorage.getItem(key);


    i = i * 1 + 1;
    window.localStorage.setItem(key, i);
    console.log(`addToCart ${key} = ${i}`);

    calculateCartItems();
    
}

function calculateCartItems() {
    let total = 0;

    for (let i = 0; i < window.localStorage.length; i++) {
        let key = window.localStorage.key(i);

        if (key.search('product')>=0) {
  
            total = total + parseInt(window.localStorage[key]);

        }
        
    }
    $('#x').val('Cart ' + total);
}

window.onload = function(){
    calculateCartItems();
    updateOrdersInput ();
}

function cartGetOrders() {
    let orders = '';

    for (i=0; i<window.localStorage.length; i++) {
        let key = window.localStorage.key(i), value = window.localStorage[key];

        if (key.search('product')>= 0) {
            orders = orders + key + '=' + value +', ';
        }
    }
    return orders;
}

function updateOrdersInput () {
    let orders = cartGetOrders();

    $('#orders').val(orders);
    
}
