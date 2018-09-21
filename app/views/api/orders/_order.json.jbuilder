
json.subtotal order.subtotal
json.tax order.tax
json.total order.total

json.formatted do
  json.subtotal number_to_currency(order.subtotal)
  json.tax number_to_currency(order.tax)
  json.total number_to_currency(order.total)
end


json.product do
  json.array! order.products, partial: 'api/products/product', as: :product
end

json.carted_product @carted_product