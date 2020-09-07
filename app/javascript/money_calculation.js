function calculate() {
  
  const get_price = document.getElementById("item-price");
  const item_tax = document.getElementById("add-tax-price");
  const profit_price = document.getElementById("profit");
    get_price.addEventListener('input', () => {
      let tax = Math.round(get_price.value * 0.1);
      let item_profit = get_price.value - tax;
      item_tax.textContent = tax;
      profit_price.textContent = item_profit;
    });
}
setInterval(calculate, 1000);
