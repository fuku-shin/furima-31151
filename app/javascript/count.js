window.addEventListener('load', function(){

  const countPrice  = document.getElementById("item-price");
  countPrice.addEventListener("keyup", () => {
    const itemPrice = countPrice.value;
    console.log(itemPrice)
    const taxPrice  = document.getElementById("add-tax-price");
    const tax = (itemPrice * 0.1) ;
    taxPrice.innerHTML = tax;
    const Profit  = document.getElementById("profit");
    itemProfit =  ( itemPrice - tax);
    Profit.innerHTML = itemProfit;


  });

})