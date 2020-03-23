module MessageToUser
  def hello_message
    puts <<~text

    どうしますか？
    1. 飲み物を選ぶ
    2. 追加でお金を入れる
    3. 投入金額を確認する
    4. お釣りを出して終了

    text
  end

  def select_juice_message
    puts <<~text

    何を購入しますか？
    1. 水(100円)
    2. コーラ(150円)
    3. モンスター(210円)

    text
  end

  def buy_juice_message(juice)
    puts <<~text

      #{juice.price}円の#{juice.name}を購入しました

    text
  end

  def enough_money_message(total_insert_money)
    if total_insert_money > 0
      puts <<~text

        お買い上げありがとうございます
        自動販売機には#{total_insert_money}円が入っています
      text
    elsif total_insert_money == 0
      puts "お買い上げありがとうございます"
    end
  end

  def not_enough_money_message
    puts "お金が足りません"
  end

  def insert_money_message
    puts <<~text

      お金を何円入れますか？
      10,50,100,500,1000から選んで入力してください

    text
  end

  def confirm_money_message(total_insert_money)
    puts "自動販売機には#{total_insert_money}円入っています"
  end

  def error_message
    puts <<~text

        入力に誤りがあります
        やり直して下さい

      text
  end

  def refund_money_message(refund_money)
    puts <<~text

        #{refund_money}円が戻ってきた

      text
  end

  def thanks_message
    puts <<~text

        お釣りはありません
        ありがとうございました

      text
  end

  module_function :hello_message
  module_function :select_juice_message
  module_function :insert_money_message
  module_function :buy_juice_message
  module_function :enough_money_message
  module_function :not_enough_money_message
  module_function :confirm_money_message
  module_function :error_message
  module_function :refund_money_message
  module_function :thanks_message
end