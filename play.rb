require './vender_machine'
require './message_to_user'

class Play
  include MessageToUser
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze
  vender = VenderMachine.new
# プログラムの実行
  loop do
    MessageToUser.hello_message

    case  gets.to_i
    when 1
      MessageToUser.select_juice_message
      select_juice_num = gets.to_i
      judge_to_buy = vender.buy(select_juice_num)
      if judge_to_buy == true
        MessageToUser.buy_juice_message(vender.juice[select_juice_num])
        MessageToUser.enough_money_message(vender.total_insert_money)
      elsif judge_to_buy == false
        MessageToUser.error_message
      else
        MessageToUser.not_enough_money_message
      end
    when 2
      MessageToUser.insert_money_message
      insert_money = gets.to_i
      vender.insert(insert_money)
      if AVAILABLE_MONEY.include?(insert_money)
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