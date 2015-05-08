class ProductCatalogue
  def initialize(products)
    @products = products  
  end

  def price_from_barcode(barcode)
    @products.fetch(barcode, "Product not found")
  end
end