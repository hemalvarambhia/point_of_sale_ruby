# coding: utf-8
class EnglishLanguageTextDisplay
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

  def initialize post_office
    @post_office = post_office
  end

  def display_scanned_product_price_message price
    render(PRICE_FORMAT, price.in_pounds)
  end
  
  def display_product_not_found_message barcode
    render(PRODUCT_NOT_FOUND_FORMAT, barcode)
  end

  def display_empty_barcode_message
    render(EMPTY_BARCODE_FORMAT, Object.new)
  end
  
  def render_view sale_view
    if sale_view.view_name == "Product Not Found"
      display_product_not_found_message sale_view.placeholder_values[:barcode]
    elsif sale_view.view_name == "Scanned Product Price"
      display_scanned_product_price_message(
        sale_view.placeholder_values[:price])
    elsif sale_view.view_name == "Scanned Empty Barcode"
      display_empty_barcode_message
    end
  end

  private
  def render(format, objects)
    @post_office.send_message merge_template(format, objects)
  end

  def merge_template(format, object)
    format.call object
  end
end

