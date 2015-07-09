require 'stringio'
require './text_processor_and_command_interpreter.rb'
require "./sale_controller.rb"
require './english_language_console_display.rb'
require './in_memory_catalogue.rb'
require './price.rb'

sale_controller = SaleController.new(
  EnglishLanguageConsoleDisplay.new, 
  InMemoryCatalogue.new({
   "12345" => Price.pence(795),
   "23456" => Price.pence(1250)
  })
)
text_processor_and_command_interpreter =
  TextProcessorAndCommandInterpreter.new sale_controller
reader = StringIO.new("12345\n23456\n99999\n\n")

text_processor_and_command_interpreter.process reader

