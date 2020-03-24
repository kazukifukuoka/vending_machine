require './stock.rb'
require './message_to_user'

class VendengMachine
  stock = Stock.new
# プログラムの実行
  loop do
    hello

    case  gets.to_i
    when 1
      select_juice
      @select_juice_num = gets.to_i
      @buy_flag = stock.buy(@select_juice_num)
      if @buy_flag == true
        buy_juice(stock.juice[@select_juice_num])
        enough_money(stock.total_insert_money)
      elsif @buy_flag == false
        error
      else
        not_enough_money
      end
    when 2
      insert_money
      @insert_money = gets.to_i
      @insert_flag = stock.insert(@insert_money)
      if @insert_flag
        confirm_money(stock.total_insert_money)
      else
        error
      end
    when 3
      confirm_money(stock.total_insert_money)
    when 4
      if stock.refund_money > 0
        stock.refund
        refund_money(stock.refund_money)
      else
        thanks
      end
      break
    else
      error
    end
  end
end