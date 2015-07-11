# coding: utf-8
require 'console_post_office'

class EnglishLanguageConsoleDisplay
  PRICE_FORMAT = lambda { |price_in_pounds|
    price = "%.2f" % (price_in_pounds)
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

  def initialize post_office = ConsolePostOffice.new
    @post_office = post_office
  end

  def display_price price
    render(PRICE_FORMAT, price.in_pounds)
  end
  
  def display_product_not_found_message barcode
    render(PRODUCT_NOT_FOUND_FORMAT, barcode)
  end

  def display_empty_barcode_message
    render(EMPTY_BARCODE_FORMAT, Object.new)
  end

  private
  def render(format, objects)
    ConsolePostOffice.new.send_message merge_template(format, objects)
  end

  def merge_template(format, object)
    format.call object
  end
end
