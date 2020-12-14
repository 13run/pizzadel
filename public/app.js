

function addToCart(id) {
    let key = `product_${id}`;
    let i = window.localStorage.getItem(key);


    i = i * 1 + 1;
    window.localStorage.setItem(key, i);
    console.log(`addToCart ${key} = ${i}`);

    calculateCartItems();
    updateOrdersInput();
    
}

function calculateCartItems() {
    let total = 0;

    for (let i = 0; i < window.localStorage.length; i++) {
        let key = window.localStorage.key(i);

        if (key.search('product')>=0) {
  
            total = total + parseInt(window.localStorage[key]);

        }
        
    }
    $('#submit_orders').val('Cart ' + total);
}


function cartGetOrders() {
    let orders = '';

    for (i=0; i<window.localStorage.length; i++) {
        let key = window.localStorage.key(i), value = window.localStorage[key];

        if (key.search('product')>= 0) {
            orders = orders + key + '=' + value +',';
        }
    }
    return orders;
}
cartGetOrders()

function updateOrdersInput () {
    let orders = cartGetOrders();

    $('#input_orders').val(orders);
    
}
updateOrdersInput()

const productCountElements = document.getElementsByClassName('cart_product_count');
const productPriceElements = document.getElementsByClassName('cart_product_price');


function cartTotalCounter() {
    let totalRow = 0;
    let totalPrice = 0;
    const totalPriceElement = document.getElementById('total_price') 

    for (let i = 0; i<productCountElements.length; i++) {
        let productCount = parseInt(productCountElements[i].value)


        for (let j = 0; j<productPriceElements.length; j++) {
            let productPrice = parseInt(productPriceElements[j].innerHTML) 
            

            if (i === j) {
                totalRow = productPrice * productCount;
                totalPrice += totalRow
            }

        }
    }
    
    const formater = new Intl.NumberFormat('ru');
    totalPriceElement.innerHTML = formater.format(totalPrice) + ' rub.'
} 

function totalPriceReloader() {

   [].forEach.call(productCountElements, function (item) {
        item.addEventListener('input', cartTotalCounter, console.log(parseInt(item.id)));
        ;
    })
    
}

window.onload = function(){
    calculateCartItems();
    cartTotalCounter();
    totalPriceReloader();
}

