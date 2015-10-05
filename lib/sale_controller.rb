class SaleController
  def initialize(catalogue)
    @catalogue = catalogue
  end
  
# on_barcode does not attempt to detect '' (empty string)
# Barcodes of non-standard/incorrect format will simply be
# treated as products not found
  def on_barcode barcode
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