require './vender_machine'
require './message_to_user'

class Play
include MessageToUser
vender = VenderMachine.new
# プログラムの実行
loop do
  puts MessageToUser.hello_message
  case  gets.to_i
  when 1
    vender.buy
  when 2
    vender.insert
  when 3
    vender.confirm
  when 4
    vender.refund
    break
  else
    puts "1~4の番号を入力して下さい"
  end
end
end