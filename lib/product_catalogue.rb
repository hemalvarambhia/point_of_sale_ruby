# -*- coding: utf-8 -*-
class ProductCatalogue
  def initialize(prices_as_txt_by_barcode, prices_in_pence_by_barcode)
    @prices_as_txt_by_barcode = prices_as_txt_by_barcode
    @prices_in_pence_by_barcode = prices_in_pence_by_barcode   
  end
 
  def contains?(barcode)
    @prices_as_txt_by_barcode.has_key?(barcode)
  end

   def format(price_in_pence)
    price = "%.2f" % (price_in_pence.to_f/100.0)
    pounds, pence = price.split('.')
    pounds = pounds.reverse.scan(/\d{1,3}/).join(",").reverse
    price = "£#{pounds}.#{pence}"
     
    price
  end

  def find_price barcode
    @prices_in_pence_by_barcode[barcode]
  end 
end
