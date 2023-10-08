function calculate (){
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keyup", () => {
    const totalPrice = itemPrice.value;
    const taxPrice = Math.floor(totalPrice*0.1);
    const profitPrice = totalPrice-taxPrice;
    
    
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');

    addTaxPrice.innerHTML = Math.floor(taxPrice);
    profit.innerHTML = Math.floor(profitPrice);


    
  });
  
};

window.addEventListener('turbo:load', calculate);
