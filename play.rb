require './vending_machine'
require './drink'

machine = VendingMachine.new
cola = Drink.new(name: "コーラ", price: 100)

puts <<~text
  お金を何円入れますか？
  10,50,100,500,1000から選んで入力してください

text
@money = gets.to_i
machine.insert(@money)

# puts "#{@money}"