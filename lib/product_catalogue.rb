class ProductCatalogue
  def initialize(prices_as_txt_by_barcode, prices_in_pence_by_barcode)
    @prices_as_txt_by_barcode = prices_as_txt_by_barcode
    @prices_in_pence_by_barcode = prices_in_pence_by_barcode   
  end
 
  def contains?(barcode)
    @prices_as_txt_by_barcode.has_key?(barcode)
  end

  def price_from_barcode(barcode)
    @prices_as_txt_by_barcode[barcode]
  end
end
