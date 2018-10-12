var productTemplate = document.querySelector('#product-card');
var productContainer = document.querySelector('.row');

axios.get("http://localhost:3000/api/products").then(function(response) {
var products = response.data;
console.log(products);

products.forEach(function(product) {
  var productClone = productTemplate.content.cloneNode(true);

  productClone.querySelector('.product-title').innerText = product.name;
  productClone.querySelector('.product-price').innerText = product["price"];
  productClone.querySelector('.product-description').innerText = product.description;
 

  productContainer.appendChild(productClone);

});


});



