require './user'
require './vending_machine'
require './drink'

user = User.new
machine = VendingMachine.new(machine: machine)
cola = Drink.new(name: "コーラ", price: 100)

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