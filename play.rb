require './user'

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
  else
    puts "1~4の番号を入力して下さい"
  end
end