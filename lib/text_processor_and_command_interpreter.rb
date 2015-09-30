class TextProcessorAndCommandInterpreter
   def initialize(listener, renderer)
     @listener = listener
     @renderer = renderer
   end
    
   def process stream
     process_lines stream
   end

   private

   def process_lines stream
     interpret_lines sanitise_lines(stream)
   end

   def sanitise_lines lines
     lines.collect{ |line| line.strip }
   end

   def interpret_lines sanitised_lines
     sanitised_lines.select{ |line| !line.empty? }
       .each { |line| interpret_line line }
   end

   def interpret_line line
     sale_view = @listener.on_barcode line
     @renderer.render_view sale_view
   end
end
 
