require 'stringio'
require './text_processor_and_command_interpreter.rb'
require "./sale_controller.rb"
require './english_language_text_display.rb'
require './in_memory_catalogue.rb'
require './price.rb'
require './console_post_office.rb'

class NullViewRenderer
  def render sale_view

  end
end

sale_controller = SaleController.new(
  EnglishLanguageTextDisplay.new(ConsolePostOffice.new) , 
  InMemoryCatalogue.new({
   "12345" => Price.pence(795),
   "23456" => Price.pence(1250)
  })
)
text_processor_and_command_interpreter =
  TextProcessorAndCommandInterpreter.new(
   sale_controller,
   EnglishLanguageTextDisplay.new(ConsolePostOffice.new))
reader = StringIO.new("12345\n23456\n99999\n\n")

text_processor_and_command_interpreter.process reader

