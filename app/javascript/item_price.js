window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addtaxValue = inputValue * 0.1
    addTaxDom.innerHTML =  Math.floor(addtaxValue) ;

    const proFitDom = document.getElementById("profit");
    profitValue = inputValue - addtaxValue
    proFitDom.innerHTML =  Math.floor(profitValue) ;
  })
  });