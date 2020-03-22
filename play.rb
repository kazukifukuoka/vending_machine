require './user'
require './vending_machine'
require './drink'

user = User.new

# プログラムの実行
loop do
  user.action
  case  gets.to_i
  when 1
    puts <<~text

    何を購入しますか？
    1. 水(100円)
    2. コーラ(150円)
    3. モンスター(210円)

    text
    Drink.buy
    Drink.buy_message
    user.buy
  when 2
    user.insert
  when 3
    user.confirm
  when 4
    user.refund
    break
  end
end