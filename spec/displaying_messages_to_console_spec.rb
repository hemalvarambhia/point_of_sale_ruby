describe "Displaying messages to the console" do
  class ConsoleDisplay
    def product_not_found_message barcode
      p "Product not found for #{barcode}"
    end
  end

  before :each do
    @old_console = $stdout
    @canvas = StringIO.new 
    $stdout = @canvas
  end

  after :each do
    @canvas.truncate 0
    $stdout = @old_console
  end

  context "when the product is not found" do
    it "tells the user there is no product for a barcode" do
      ConsoleDisplay.new.product_not_found_message("654321")       
     
      expect(text_from(@canvas)).to eq("Product not found for 654321")
    end    
  end

  def text_from canvas
    canvas.string.strip.gsub(/\"/, "")
  end
end