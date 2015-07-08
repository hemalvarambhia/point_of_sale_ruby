# coding: utf-8
class ConsoleDisplay
  PRICE_FORMAT = lambda { |price|
    price = "%.2f" % (price.in_pounds)
    pounds, pence = price.split('.')
    pounds = pounds.reverse.scan(/\d{1,3}/).join(",").reverse
    price = "£#{pounds}.#{pence}"

    price
  }

  PRODUCT_NOT_FOUND_FORMAT = lambda { |barcode|
    "Product not found for %s" % barcode
  }

  EMPTY_BARCODE_FORMAT = lambda {
    "Scanning error: empty barcode"
  } 

  def display_price price
    p PRICE_FORMAT.call(price)
  end
  
  def display_product_not_found_message barcode
    p PRODUCT_NOT_FOUND_FORMAT.call barcode
  end

  def display_empty_barcode_message
    p EMPTY_BARCODE_FORMAT.call
  end

  private
  def format(price)
    price = "%.2f" % (price.in_pounds)
    pounds, pence = price.split('.')
    pounds = pounds.reverse.scan(/\d{1,3}/).join(",").reverse
    price = "£#{pounds}.#{pence}"
     
    price
  end

end
