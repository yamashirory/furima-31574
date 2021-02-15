window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    const Profit = document.getElementById("profit");
    const value_result = inputValue * 0.1
    Profit.innerHTML = (Math.floor(inputValue - value_result));
})
});