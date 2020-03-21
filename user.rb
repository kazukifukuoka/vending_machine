require './drink'

class User < Drink
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize(**params)
    @total_insert_money = 0
    @refund_money = 0
  end

  def buy
    puts <<~text

    何を購入しますか？
    1. 水(120円)
    2. コーラ(150円)
    3. モンスター(210円)

    text
    Drink.buy

  end

  def insert
    puts <<~text

      お金を何円入れますか？
      10,50,100,500,1000から選んで入力してください

    text
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

  def action
    puts <<~text

      次はどうする？
      1. 飲み物を選ぶ
      2. 追加でお金を入れる
      3. 投入金額を確認する
      4. お釣りを出す

    text
  end

  def refund

    if @refund_money > 0
      puts <<~text

        #{@refund_money}円が戻ってきた

      text
      @refund_money = @total_insert_money
    else
      puts "お金を入れてください"
    end
  end

  def confirm

    puts <<~text

    自動販売機には#{@total_insert_money}円入っています

    text
  end

end