class ProductCatalogue
  def initialize(products)
    @products = products  
  end
 
  def contains?(barcode)
    @products.has_key?(barcode)
  end

  def price_from_barcode(barcode)
    @products[barcode]
  end
end
