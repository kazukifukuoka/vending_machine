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
      select_juice_num = gets.to_i
      buy_flag = vender.buy(select_juice_num)
      if buy_flag == true
        MessageToUser.buy_juice_message(vender.juice[select_juice_num])
        MessageToUser.enough_money_message(vender.total_insert_money)
      elsif buy_flag == false
        MessageToUser.error_message
      else
        MessageToUser.not_enough_money_message
      end
    when 2
      MessageToUser.insert_money_message
      insert_money = gets.to_i
      insert_flag = vender.insert(insert_money)
      if insert_flag
        MessageToUser.confirm_money_message(vender.total_insert_money)
      else
        MessageToUser.error_message
      end
    when 3
      MessageToUser.confirm_money_message(vender.total_insert_money)
    when 4
      if vender.refund_money > 0
        vender.refund
        MessageToUser.refund_money_message(vender.refund_money)
      else
        MessageToUser.thanks_message
      end
      break
    else
      MessageToUser.error_message
    end
  end
end