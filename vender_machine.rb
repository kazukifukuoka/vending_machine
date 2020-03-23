require './drink'
require './message_to_user'

class VenderMachine
  include MessageToUser
  @@water = Drink.new(name: "水", price: 100, stock: 10)
  @@cola = Drink.new(name: "コーラ", price: 150, stock: 5)
  @@monster = Drink.new(name: "モンスター", price: 210, stock: 3)
  # ユーザーが使えるお金
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize(**params)
    @total_insert_money = 0
    @refund_money = 0
  end

  # 1. 飲み物の購入
  def buy()
    case  gets.to_i
    when 1
      juice = @@water
    when 2
      juice = @@cola
    when 3
      juice = @@monster
    end

    if @total_insert_money >= juice.price
      MessageToUser.buy_juice_message(juice)
      @total_insert_money -= juice.price
      MessageToUser.enough_money_message(@total_insert_money)
      @refund_money = @total_insert_money
    else
      MessageToUser.not_enough_money_message
    end

  end

  # 2. お金を入れる
  def insert

    @insert_money = gets.to_i
    if AVAILABLE_MONEY.include?(@insert_money)
      @total_insert_money += @insert_money
      MessageToUser.confirm_money_message(@total_insert_money)
      @refund_money = @total_insert_money
    else
      MessageToUser.error_message
      @refund_money = @insert_money
      refund
    end
  end

  # 3. 投入金額の確認
  def confirm
    MessageToUser.confirm_money_message(@total_insert_money)
  end

  # 4. お釣りを出す
  def refund

    if @refund_money > 0
      MessageToUser.refund_money_message(@refund_money)
      @refund_money = @total_insert_money
    else
      MessageToUser.thanks_message
    end
  end
end