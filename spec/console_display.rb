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

  EMPTY_BARCODE_FORMAT = lambda {|no_object|
    "Scanning error: empty barcode"
  } 

  def display_price price
    p display_message(PRICE_FORMAT, price)
  end
  
  def display_product_not_found_message barcode
    p display_message(PRODUCT_NOT_FOUND_FORMAT, barcode)
  end

  def display_empty_barcode_message
    p display_message(EMPTY_BARCODE_FORMAT, Object.new)
  end

  def display_message(format, objects)
    format.call objects
  end
end
