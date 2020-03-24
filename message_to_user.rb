def hello
  puts <<~text

  どうしますか？
  1. 飲み物を選ぶ
  2. お金を入れる
  3. 投入金額を確認する
  4. お釣りを出して終了

  text
end

def select_juice
  puts <<~text

  何を購入しますか？
  1. 水(100円)
  2. コーラ(150円)
  3. モンスター(210円)
  4. フルーツジュース(80円)
  5. リポビタンD(130円)
  6. ファンタグレープ(150円)

  text
end

def buy_juice(juice)
  puts <<~text

    #{juice.price}円の#{juice.name}を購入しました
  text
end

def enough_money(total_insert_money)
  if total_insert_money > 0
    puts <<~text

      お買い上げありがとうございます
      自動販売機には#{total_insert_money}円が入っています
    text
  elsif total_insert_money == 0
    puts "お買い上げありがとうございます"
  end
end

def not_enough_money
  puts "お金が足りません"
end

def insert_money
  puts <<~text

    どの硬貨を入れますか？
    10,50,100,500,1000から選んで入力してください

  text
end

def confirm_money(total_insert_money)
  puts <<~text

    自動販売機には#{total_insert_money}円入っています
    text
end

def error
  puts <<~text

      入力に誤りがあります
      やり直して下さい
    text
end

def refund_money(refund_money)
  puts <<~text

      #{refund_money}円が戻ってきた
      ありがとうございました

    text
end

def thanks
  puts <<~text

      お釣りはありません
      ありがとうございました

    text
end