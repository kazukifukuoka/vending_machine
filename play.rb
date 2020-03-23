require './vender_machine'
require './message_to_user'

class Play
include MessageToUser
vender = VenderMachine.new
# プログラムの実行
loop do
  MessageToUser.hello_message

  case  gets.to_i
  when 1
    MessageToUser.select_juice_message
    res = vender.buy(gets.to_i)
  when 2
    MessageToUser.insert_money_message
    vender.insert
  when 3
    vender.confirm
  when 4
    vender.refund
    break
  else
    MessageToUser.error_message
  end
end
end