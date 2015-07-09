describe "Interpreting text commands" do
  class TextCommandInterpreter
    def initialize listener
      @listener = listener
    end
    
    def process stream
      stream.each_line { |line|
        @listener.on_barcode(line.strip)
      }
    end
  end
  
  context "no commands" do
    it "does nothing" do
      barcode_listener = double("BarcodeScannedListener")

      expect(barcode_listener).to_not receive(:on_barcode)

      TextCommandInterpreter.new(barcode_listener).process StringIO.new("")
    end
  end

  context "one barcode" do
    it "processes the barcode" do
      barcode_listener = double("BarcodeScannedListener")

      expect(barcode_listener).to receive(:on_barcode).with("::barcode::").once

      TextCommandInterpreter.new(barcode_listener).process StringIO.new("::barcode::\n")
    end
  end

  context "several barcodes" do
    it "process all of them" do
       barcode_listener = double("BarcodeScannedListener")

       expect(barcode_listener).to receive(:on_barcode).with("12345")
       expect(barcode_listener).to receive(:on_barcode).with("23456")
       expect(barcode_listener).to receive(:on_barcode).with("34567")

       TextCommandInterpreter.new(barcode_listener).process StringIO.new("12345\n23456\n34567")
    end
  end
end
