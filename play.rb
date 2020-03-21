require './user'
require './vending_machine'
require './drink'

user = User.new

# プログラムの実行
loop do
  user.action
  case  gets.to_i
  when 1
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