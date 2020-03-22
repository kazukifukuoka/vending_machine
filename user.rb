require './drink'

class User
  # ユーザーが使えるお金
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize(**params)
    @total_insert_money = 0
    @refund_money = 0
  end

  # ユーザーの選択肢
  def action
    puts <<~text

      どうしますか？
      1. 飲み物を選ぶ
      2. 追加でお金を入れる
      3. 投入金額を確認する
      4. お釣りを出して終了

    text
  end

  # 1. 飲み物の購入
  def buy
    water = Drink.new(name: "水", price: 100, stock: 10)
    cola = Drink.new(name: "コーラ", price: 150, stock: 5)
    monster = Drink.new(name: "モンスター", price: 210, stock: 3)
    puts <<~text

    何を購入しますか？
    1. 水(100円)
    2. コーラ(150円)
    3. モンスター(210円)

    text

    case  gets.to_i
    when 1
      juice = water
    when 2
      juice = cola
    when 3
      juice = monster
    end

    if @total_insert_money >= juice.price
      puts <<~text

      #{juice.price}円の#{juice.name}を購入しました

    text
    @total_insert_money -= juice.price
      if @total_insert_money > 0
        puts <<~text

          お買い上げありがとうございます
          自動販売機には#{@total_insert_money}円が入っています
        text
      elsif @total_insert_money == 0
        puts "お買い上げありがとうございます"
      end
    @refund_money = @total_insert_money
    else
      puts "お金が足りません"
    end

  end

  # 2. お金を入れる
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