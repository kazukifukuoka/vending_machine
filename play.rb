require './vending_machine'
require './message_to_user'

class Play
  vender = VendingMachine.new
# プログラムの実行
  loop do
    hello

    case  gets.to_i
    when 1
      select_juice
      @select_juice_num = gets.to_i
      @buy_flag = vender.buy(@select_juice_num)
      if @buy_flag == true
        buy_juice(vender.juice[@select_juice_num])
        enough_money(vender.total_insert_money)
      elsif @buy_flag == false
        error
      else
        not_enough_money
      end
    when 2
      insert_money
      @insert_money = gets.to_i
      @insert_flag = vender.insert(@insert_money)
      if @insert_flag
        confirm_money(vender.total_insert_money)
      else
        error
      end
    when 3
      confirm_money(vender.total_insert_money)
    when 4
      if vender.refund_money > 0
        vender.refund
        refund_money(vender.refund_money)
      else
        thanks
      end
      break
    else
      error
    end
  end
end