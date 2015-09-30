class SaleController
  def initialize(display, catalogue)
    @display = display
    @catalogue = catalogue
  end

  def on_barcode barcode
    # SMELL: Should the method ever receive blank barcodes?
    if barcode.empty?
      return SaleView.new(
          "Scanned Empty Barcode", 
          {})
    end

    price = @catalogue.find_price barcode
    if price.nil?
      return SaleView.new(
          "Product Not Found",
          {"barcode" => barcode})
    else
      return SaleView.new(
          "Scanned Product Price",
          {"price" => price})
    end
  end
end

class SaleView
  attr_reader :view_name, :placeholder_values

  def initialize(view_name = "", placeholder_values = {})
    @view_name = view_name 
    @placeholder_values = placeholder_values
  end
end