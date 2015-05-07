require_relative '../lib/display'
require_relative '../lib/point_of_sale'
describe "Point of Sale system" do
 before :each do
   catalogue = {
      "123456" => "£1.50",
      "246810" => "£5.00"
    }
   @display = Display.new
   @point_of_sale = PointOfSale.new(@display, catalogue)
 end
 context "when the barcode is invalid" do
  it "states the barcode is invalid" do
    @point_of_sale.on_barcode ""

    expect(@display.text).to eq("Barcode is invalid")
  end
 end

 context "when a product is found" do
   it "displays the product's price" do
     @point_of_sale.on_barcode "123456"

     expect(@display.text).to eq("£1.50")
   end

   it "displays a different price for a different product" do
     @point_of_sale.on_barcode "246810"

     expect(@display.text).to eq("£5.00")
   end
 end

 context "when a product is not found" do
   it "says the product cannot be found" do
     @point_of_sale.on_barcode "654321"

     expect(@display.text).to eq("Product not found")
   end
 end
end