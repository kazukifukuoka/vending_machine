require './drink'
require './message_to_user'

class Stock
  # ユーザーが使えるお金
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze
  attr_accessor :total_insert_money, :juice, :insert_money, :refund_money

  def initialize(**params)
    @total_insert_money = 0
    @refund_money = 0
    @juice = {
      1 => Drink.new(name: "水", price: 100, stock: 10),
      2 => Drink.new(name: "コーラ", price: 150, stock: 5),
      3 => Drink.new(name: "モンスター", price: 210, stock: 3),
      4 => Drink.new(name: "フルーツドリンク", price: 80, stock: 8),
      5 => Drink.new(name: "リポビタンD", price: 130, stock: 5),
      6 => Drink.new(name: "ファンタグレープ", price: 150, stock: 10)
    }
  end

  # 1. 飲み物の購入
  def buy(juice_index_num)
    if @juice[juice_index_num] && @total_insert_money >= @juice[juice_index_num].price
      @total_insert_money -= @juice[juice_index_num].price
      @refund_money = @total_insert_money
      @buy_flag = true
    elsif @juice[juice_index_num] == nil
      @buy_flag = false
    end
  end

  # 2. お金を入れる
  def insert(insert_money)
    @insert_money = insert_money
    @insert_flag = false
    if AVAILABLE_MONEY.include?(@insert_money)
      @total_insert_money += @insert_money
      @refund_money = @total_insert_money
      @insert_flag = true
    end
  end

  # 4. お釣りを出す
  def refund
      @refund_money = @total_insert_money
  end
end