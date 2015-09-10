require_relative '../../lib/text_processor_and_command_interpreter'
require_relative '../../lib/sale_controller'
describe "Rendering a response view from the controller" do
  it "renders the view with which the controller responds" do
     barcode_scanned_listener = double("BarcodeScannedListener")
     controller_response_view = SaleView.new("irrelevant name")
     renderer = double("Renderer") 
     allow(barcode_scanned_listener).to receive(:on_barcode).
       and_return(controller_response_view)
     expect(renderer).to receive(:render).
       with(controller_response_view)

     process_scanned_barcode_command_with(
       barcode_scanned_listener, 
       renderer)
  end

  private 

  def process_scanned_barcode_command_with(
        barcode_scanned_listener, 
        renderer)
    TextProcessorAndCommandInterpreter.new(
       barcode_scanned_listener,
       renderer
     ).process(StringIO.new("::valid barcode command::\n"))
  end
end