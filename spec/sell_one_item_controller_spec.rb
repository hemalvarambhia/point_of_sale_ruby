describe "SellOneItemController" do
  class Price
    def self.pence value
      Price.new
    end

    def to_s
      return "a price"
    end
  end

  class SaleController
    def initialize(display, catalogue)
      @display = display
      @catalogue = catalogue
    end

    def on_barcode barcode
      price = @catalogue.find_price barcode
      if price.nil?
        @display.product_not_found_message barcode
      else
        @display.display_price price
      end
    end
  end

  context "product found" do
    it "displays the price the user" do
      display = double("display")
      catalogue = double("catalogue")
      irrelevant_price = Price.pence 795
      allow(catalogue).to receive(:find_price).with("12345").and_return irrelevant_price
      expect(display).to receive(:display_price).with( irrelevant_price )
      sale_controller = SaleController.new(display, catalogue)
      
      sale_controller.on_barcode "12345"
    end
  end

  context "product not found" do
    it "tells the user the product was not found" do
      display = double("display")
      catalogue = double("catalogue")
      allow(catalogue).to receive(:find_price).with("::product not found::").and_return nil
      expect(display).to receive(:product_not_found_message).with("::product not found::")
      sale_controller = SaleController.new(display, catalogue)

      sale_controller.on_barcode "::product not found::"
    end
  end
end