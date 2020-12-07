function something() {
    let x = window.localStorage.getItem('a');
    x = x*1 + 1;
    window.localStorage.setItem('a', x);
    
   
    alert(x);

}
