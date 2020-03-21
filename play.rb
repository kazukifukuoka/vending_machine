require './user'
require './vending_machine'
require './drink'

user = User.new
machine = VendingMachine.new

water = Drink.new(name: "水", price: 100, stock: 10)
cola = Drink.new(name: "コーラ", price: 100, stock: 5)
monster = Drink.new(name: "モンスター", price: 210, stock: 3)

loop do
  user.choices
  case @select_num = gets.to_i
  when 1
    puts "1"
  when 2
    user.insert
  when 3
    user.confirm
  when 4
    user.refund
    break
  end
end