require './vending_machine'
require './drink'

machine = VendingMachine.new(machine: machine)
cola = Drink.new(name: "コーラ", price: 100)

machine.insert

loop do
  machine.choices
  case @select_num = gets.to_i
  when 1
    puts "1"
  when 2
    machine.insert
  when 3
    machine.refund
    break
  end
end