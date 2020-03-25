def hello_message
  puts <<~text

  どうしますか？
  1. 飲み物を選ぶ
  2. お金を入れる
  3. 投入金額を確認する
  4. お釣りを出して終了

  text
end

def select_juice_message(juices)
  puts <<~text

  何を購入しますか？
  text
  juices.each do |i, juice|
    puts "#{i}. #{juice.name}(#{juice.price}円)"
  end
  puts ""
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

    どの硬貨を入れますか？
    10,50,100,500,1000から選んで入力してください

  text
end

def confirm_money_message(total_insert_money)
  puts <<~text

    自動販売機には#{total_insert_money}円入っています
    text
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
      ありがとうございました

    text
end

def thanks_message
  puts <<~text

      お釣りはありません
      ありがとうございました

    text
end