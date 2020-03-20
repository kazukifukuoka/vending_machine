class VendingMachine
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @total = 0
    @drink_table = []
  end

  def insert(money)

    if AVAILABLE_MONEY.include?(money)
      @total += money
      puts "自動販売機に#{@total}円入れました"
    else
      puts <<~text

        指定された金額から選んでください
        #{money}円が戻ってきた

      text
    end
  end


end