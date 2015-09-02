require 'price'
require 'english_language_console_display'

describe "Displaying monetary amounts to the console" do
  before :each do
    @canvas = StringIO.new
    $stdout = @canvas
  end

  after :each do
    @canvas.truncate 0
    $stdout = STDOUT
  end

  def text_from canvas
    canvas.string.strip.gsub(/\"/, "").split(/\n/)
  end
 
  context "simplest amount" do
    [
       [789, "£7.89"], 
       [520, "£5.20"], 
       [400, "£4.00"], 
       [0, "£0.00"], 
       [2, "£0.02"],
       [37, "£0.37"],
       [418976, "£4,189.76"],
       [210832281, "£2,108,322.81"]
    ].each do |price_in_pence, expected_formatted_price|
      it "formats #{price_in_pence} as #{expected_formatted_price}" do
        EnglishLanguageConsoleDisplay.new.display_scanned_product_price_message(
	  Price.pence price_in_pence) 
	
        expect(text_from(@canvas)).to eq([expected_formatted_price])
      end
    end
  end
end