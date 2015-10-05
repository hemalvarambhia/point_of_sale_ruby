require 'price'
require_relative '../lib/sale_controller'
describe "SellOneItemController" do
  context "product found" do
    it "displays the price the user" do
      catalogue = double("catalogue")
      irrelevant_price = Price.pence 795
      allow(catalogue).to receive(:find_price).with("::product found::").and_return irrelevant_price
      sale_controller = SaleController.new(catalogue)
      
      sale_view = sale_controller.on_barcode "::product found::"

      expect(sale_view.view_name).to eq("Scanned Product Price")
      expect(sale_view.placeholder_values).to eq({"price" => irrelevant_price})
    end
  end

  context "product not found" do
    it "tells the user the product was not found" do
      catalogue = double("catalogue")
      allow(catalogue).to receive(:find_price).with("::product not found::").and_return nil
      sale_controller = SaleController.new(catalogue)

      sale_view = sale_controller.on_barcode "::product not found::"
   
      expect(sale_view.view_name).to eq("Product Not Found")
      expect(sale_view.placeholder_values).to eq({"barcode" => "::product not found::"})
    end
  end
end
