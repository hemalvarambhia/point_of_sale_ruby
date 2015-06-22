require 'price'
describe "In memory catalogue" do
  class InMemoryCatalogue
    def initialize(prices_by_barcode)
      @prices_by_barcode = prices_by_barcode
    end

    def find_price barcode
      @prices_by_barcode[barcode]
    end
  end

  describe "#find_price" do
    context "product is found" do
      it "returns the price for the barcode" do
        found_price = Price.pence 1250
        catalogue = InMemoryCatalogue.new({"12345" => found_price})
        expect(catalogue.find_price("12345")).to eq(found_price)
      end
    end

    context "product is not found" do
      it "returns nothing" do
        catalogue = InMemoryCatalogue.new({})
        expect(catalogue.find_price("246810")).to be_nil
      end
    end
  end
end