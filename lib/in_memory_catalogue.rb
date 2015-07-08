class InMemoryCatalogue
  def initialize(prices_by_barcode)
    @prices_by_barcode = prices_by_barcode
  end

  def find_price barcode
    @prices_by_barcode[barcode]
  end
end