shared_examples_for "any catalogue" do
  describe "finding prices" do
    context "product is found" do
      it "returns the price for the barcode" do
        found_price = Price.pence 1250
        catalogue = catalogue_with("12345", found_price)
        expect(catalogue.find_price("12345")).to eq(found_price)
      end
    end

    context "product is not found" do
      it "returns nothing" do
        catalogue = catalogue_without("12345")
        expect(catalogue.find_price("12345")).to be_nil
      end
    end
  end
end