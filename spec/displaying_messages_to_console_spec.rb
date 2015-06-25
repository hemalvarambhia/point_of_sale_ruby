require 'console_display'
describe "Displaying messages to the console" do
  before :each do
    @canvas = StringIO.new 
    $stdout = @canvas
  end

  after :each do
    @canvas.truncate 0
    $stdout = STDOUT
  end

  it "tells the user there is no product for a barcode" do
    ConsoleDisplay.new.product_not_found_message("654321")       
     
    expect(text_from(@canvas)).to eq(["Product not found for 654321"])
  end

  it "tells the user the bacode was empty" do 
    ConsoleDisplay.new.empty_barcode_message    
  
    expect(text_from(@canvas)).to eq(["Scanning error: empty barcode"])
  end

  it "displays multiple messages" do
    console_display = ConsoleDisplay.new

    console_display.empty_barcode_message
    console_display.product_not_found_message "235711"
    console_display.empty_barcode_message

    expect(text_from(@canvas)).to eq([
        "Scanning error: empty barcode", 
        "Product not found for 235711",
        "Scanning error: empty barcode"])
  end

  def text_from canvas
    canvas.string.strip.gsub(/\"/, "").split(/\n/)
  end
end