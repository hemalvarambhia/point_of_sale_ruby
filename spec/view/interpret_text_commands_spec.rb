require_relative '../../lib/text_processor_and_command_interpreter'
describe "Interpreting text commands" do
  context "no commands" do
    it "does nothing" do
      barcode_listener = double("BarcodeScannedListener")
      renderer = double("Renderer")
      allow(renderer).to receive(:render)
      expect(barcode_listener).to_not receive(:on_barcode)

      TextProcessorAndCommandInterpreter.new(
        barcode_listener,
        renderer
      ).process StringIO.new("")
    end
  end

  context "one barcode" do
    it "processes the barcode" do
      barcode_listener = double("BarcodeScannedListener")
      renderer = double("Renderer")
      allow(renderer).to receive(:render)
      expect(barcode_listener).to receive(:on_barcode).with("::barcode::").once

      TextProcessorAndCommandInterpreter.new(
        barcode_listener,
        renderer
      ).process StringIO.new("::barcode::\n")
    end
  end

  context "several barcodes" do
    it "process all of them" do
       barcode_listener = double("BarcodeScannedListener")
       renderer = double("Renderer")
       allow(renderer).to receive(:render)
       expect(barcode_listener).to receive(:on_barcode).with("::barcode 1::")
       expect(barcode_listener).to receive(:on_barcode).with("::barcode 2::")
       expect(barcode_listener).to receive(:on_barcode).with("::barcode 3::")

       TextProcessorAndCommandInterpreter.new(
         barcode_listener, 
         renderer
       ).process StringIO.new("::barcode 1::\n::barcode 2::\n::barcode 3::")
    end
  end

  # SMELL This test checks we don't interpret empty commands but
  # which seems to require running the interpreter
  context "several barcodes interspersed with empty lines" do
    it "processes only the barcodes" do
      barcode_listener = double("BarcodeScannedListener")
      renderer = double("Renderer")
      allow(renderer).to receive(:render)
      expect(barcode_listener).to receive(:on_barcode).with("::barcode 1::")
      expect(barcode_listener).to receive(:on_barcode).with("::barcode 2::")
      expect(barcode_listener).to receive(:on_barcode).with("::barcode 3::")

      TextProcessorAndCommandInterpreter.new(
        barcode_listener,
        renderer
      ).process StringIO.new("\n::barcode 1::\n\n::barcode 2::\n   \n\t\n::barcode 3::\n\n")
    end
  end
end
