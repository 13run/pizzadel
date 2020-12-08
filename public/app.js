function addToCart(id) {
    alert(`Pizza ${id}`);
}

function something() {
    let x = window.localStorage.getItem('a');
    x = x*1 + 1;
    window.localStorage.setItem('a', x);
    
   
    alert(x);

}


// const price = document.getElementById('price');

// const formater = new Intl.NumberFormat('ru');

// price.innerText = formater.format(price.value);

