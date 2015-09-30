require_relative '../../lib/english_language_text_display'
require_relative '../../lib/sale_controller'
require_relative '../../lib/price'
describe "Rendering sale views in English" do
  context "when the product is found" do
    it "renders the scanned product price view" do
      post_office = double("PostOffice")
      expect(post_office).to receive(:send_message).with("£7.95")

      EnglishLanguageTextDisplay.new(post_office).render_view(
        SaleView.new(
          "Scanned Product Price", {price: Price.pence(795)}))
    end
  end
  
  context "when the product is not found" do
    it "renders the product not found view" do
      post_office = double("PostOffice")
      expect(post_office).to receive(:send_message).with("Product not found for 5834958")

      EnglishLanguageTextDisplay.new(post_office).render_view(
        SaleView.new(
          "Product Not Found", {barcode: "5834958"}))
    end
  end
end