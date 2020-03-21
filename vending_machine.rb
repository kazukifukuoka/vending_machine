class VendingMachine
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize(machine:)
    @machine = machine
    @total = 0
    @drink_table = []
  end

  def insert
    puts <<~text

      お金を何円入れますか？
      10,50,100,500,1000から選んで入力してください

    text
    @money = gets.to_i
    if AVAILABLE_MONEY.include?(@money)
      @total += @money
      puts "自動販売機には#{@total}円入っています"
    else
      puts <<~text

        指定された金額から選んでください
      text
      refund
    end
  end


  def choices
    puts <<~text

      次はどうする？
      1. 飲み物を選ぶ
      2. 追加でお金を入れる
      3. お釣りを出す

    text
  end

  def refund
    if AVAILABLE_MONEY.include?(@money)
      refund_money = @total
    else
      refund_money = @money
    end
    puts <<~text

      #{refund_money}円が戻ってきた

    text
    refund_money = @total
  end
end