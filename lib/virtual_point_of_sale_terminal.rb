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

sale_controller.on_barcode "12345"
sale_controller.on_barcode "23456"
sale_controller.on_barcode "99999"
sale_controller.on_barcode ""