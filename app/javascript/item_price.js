function item() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value; 
    const addTaxDom = document.getElementById("add-tax-price");
    const ItemPrice = document.getElementById("profit");
    const tax = 0.1;
    const itemValue = inputValue - (inputValue * tax);
    addTaxDom.innerHTML = Math.floor(inputValue * tax) 
    ItemPrice.innerHTML = Math.floor(itemValue) 
  })
};
setInterval(item, 1000);
