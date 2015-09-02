require 'english_language_text_display'
require 'console_post_office'
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
    EnglishLanguageTextDisplay.new(ConsolePostOffice.new).display_product_not_found_message("654321")       
     
    expect(text_from(@canvas)).to eq(["Product not found for 654321"])
  end

  it "tells the user the bacode was empty" do 
    EnglishLanguageTextDisplay.new(ConsolePostOffice.new).display_empty_barcode_message    
  
    expect(text_from(@canvas)).to eq(["Scanning error: empty barcode"])
  end

  it "displays multiple messages" do
    console_display = EnglishLanguageTextDisplay.new ConsolePostOffice.new

    console_display.display_empty_barcode_message
    console_display.display_product_not_found_message "235711"
    console_display.display_empty_barcode_message

    expect(text_from(@canvas)).to eq([
        "Scanning error: empty barcode", 
        "Product not found for 235711",
        "Scanning error: empty barcode"])
  end

  def text_from canvas
    canvas.string.strip.gsub(/\"/, "").split(/\n/)
  end
end
