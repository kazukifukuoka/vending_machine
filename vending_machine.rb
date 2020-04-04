require './stock.rb'
require './message_to_user'

class VendingMachine
  # プログラムの実行
  @stock = Stock.new

  def self.vm
    loop do
      hello_message

      case  gets.to_i
      when 1
        select_juice_message(@stock.juices)
        @select_juice_num = gets.to_i
        @buy_flag = @stock.buy(@select_juice_num)
        if @buy_flag == "error"
          error_message
        elsif @buy_flag == true
          buy_juice_message(@stock.juices[@select_juice_num])
          enough_money_message(@stock.total_insert_money)
        elsif @buy_flag == false
          not_enough_money_message
        else
          no_stock_message
        end
      when 2
        insert_money_message
        @insert_money = gets.to_i
        @insert_flag = @stock.insert(@insert_money)
        if @insert_flag
          confirm_money_message(@stock.total_insert_money)
        else
          error_message
        end
      when 3
        confirm_money_message(@stock.total_insert_money)
      when 4
        if @stock.total_insert_money > 0
          refund_money_message(@stock.total_insert_money)
        else
          thanks_message
        end
        break
      else
        error_message
      end
    end
  end
end