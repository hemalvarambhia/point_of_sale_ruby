# -*- coding: utf-8 -*-
class ProductCatalogue
  def initialize(prices_as_txt_by_barcode, prices_in_pence_by_barcode)
    @prices_in_pence_by_barcode = prices_in_pence_by_barcode   
  end
 
  def contains?(barcode)
    @prices_in_pence_by_barcode.has_key?(barcode)
  end

  def find_price barcode
    @prices_in_pence_by_barcode[barcode]
  end 
end
