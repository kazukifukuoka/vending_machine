require './drink'
require './message_to_user'

class Stock
  # ユーザーが使えるお金
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze
  ADJUST_NUM = 1
  attr_accessor :total_insert_money, :juices, :insert_money, :refund_money

  def initialize(**params)
    @total_insert_money = 0
    @refund_money = 0
    @juices = {
      1 => Drink.new(name: "水", price: 100, stock: 10),
      2 => Drink.new(name: "コーラ", price: 150, stock: 5),
      3 => Drink.new(name: "モンスター", price: 210, stock: 3),
      4 => Drink.new(name: "フルーツドリンク", price: 80, stock: 8),
      5 => Drink.new(name: "リポビタンD", price: 130, stock: 5),
      6 => Drink.new(name: "ファンタグレープ", price: 150, stock: 10),
      7 => Drink.new(name: "烏龍茶", price: 110, stock: 7)
    }
  end

  # 1. 飲み物の購入
  def buy(juice_index_num)
    if @juices[juice_index_num].nil?
      @buy_flag = "error"
    elsif @total_insert_money >= @juices[juice_index_num].price
      return if @juices[juice_index_num].stock == 0
      @total_insert_money -= @juices[juice_index_num].price
      @juices[juice_index_num].stock -= 1
      @buy_flag = true
    else
      @buy_flag = false
    end
  end

  # 2. お金を入れる
  def insert(insert_money)
    @insert_money = insert_money
    @insert_flag = false
    if AVAILABLE_MONEY.include?(@insert_money)
      @total_insert_money += @insert_money
      @insert_flag = true
    end
  end

end