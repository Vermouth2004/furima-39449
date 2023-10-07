function calculate (){
  const itemPrice = document.getElementById("item-price")

  itemPrice.addEventListener("keyup", () => {
    const totalPrice = itemPrice.value
    const taxPrice = totalPrice*0.1
    const profit = totalPrice-taxPrice
    
  });
  
};

window.addEventListener('turbo:load', calculate);
