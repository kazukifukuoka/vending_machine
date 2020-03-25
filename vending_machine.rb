require './stock.rb'
require './message_to_user'

class VendengMachine
  stock = Stock.new
# プログラムの実行
  loop do
    hello_message

    case  gets.to_i
    when 1
      select_juice_message
      @select_juice_num = gets.to_i
      @buy_flag = stock.buy(@select_juice_num)
      if @buy_flag == true
        buy_juice_message(stock.juice[@select_juice_num])
        enough_money_message(stock.total_insert_money)
      elsif @buy_flag == false
        error_message
      else
        not_enough_money_message
      end
    when 2
      insert_money_message
      @insert_money = gets.to_i
      @insert_flag = stock.insert(@insert_money)
      if @insert_flag
        confirm_money_message(stock.total_insert_money)
      else
        error_message
      end
    when 3
      confirm_money_message(stock.total_insert_money)
    when 4
      if stock.refund_money > 0
        stock.refund
        refund_money_message(stock.refund_money)
      else
        thanks_message
      end
      break
    else
      error_message
    end
  end
end