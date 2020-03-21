# require './user'
# require './vending_machine'
# require './drink'


# class GamesController

#   user = User.new

#   def play
#     loop do
#       user.action
#       case @select_num = gets.to_i
#       when 1
#         puts "a"
#       when 2
#         user.insert
#       when 3
#         user.confirm
#       when 4
#         user.refund
#         break
#       end
#     end
#   end
# end