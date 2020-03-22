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
  def buy

    puts MessageToUser.select_juice_message
    case  gets.to_i
    when 1
      juice = @@water
    when 2
      juice = @@cola
    when 3
      juice = @@monster
    end

    if @total_insert_money >= juice.price
      puts MessageToUser.buy_juice_message(juice)
      @total_insert_money -= juice.price
# ーー毎回ローカル変数に代入してモジュールのメソッドを呼ぶのかーーーー
      total_insert_money = @total_insert_money
      puts MessageToUser.enough_money(total_insert_money)
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
      @refund_money = @total_insert_money
    else
      puts MessageToUser.not_enough_money
    end

  end

  # 2. お金を入れる
  def insert
    puts MessageToUser.insert_money_message
    @insert_money = gets.to_i
    if AVAILABLE_MONEY.include?(@insert_money)
      @total_insert_money += @insert_money
      puts "自動販売機には#{@total_insert_money}円入っています"
      @refund_money = @total_insert_money
    else
      puts <<~text

        指定された金額から選んでください

      text
      @refund_money = @insert_money
      refund
    end
  end

  # 3. 投入金額の確認
  def confirm

    puts <<~text

    自動販売機には#{@total_insert_money}円入っています

    text
  end

  # 4. お釣りを出す
  def refund

    if @refund_money > 0
      puts <<~text

        #{@refund_money}円が戻ってきた

      text
      @refund_money = @total_insert_money
    else
      puts <<~text

        お釣りはありません
        ありがとうございました

      text

    end
  end
end