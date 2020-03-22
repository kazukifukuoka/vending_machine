require './user'

class Drink < User
  attr_reader :name, :price, :stock

  def initialize(**params)
    @name = params[:name]
    @price = params[:price]
    @stock = params[:stock]
  end

  def self.buy
    water = Drink.new(name: "水", price: 100, stock: 10)
    cola = Drink.new(name: "コーラ", price: 150, stock: 5)
    monster = Drink.new(name: "モンスター", price: 210, stock: 3)

    case  gets.to_i
    when 1
      @juice = water
    when 2
      @juice = cola
    when 3
      @juice = monster
    end

  end

  def self.buy_message
  puts <<~text
  
  #{@juice.name}を購入しました
  
  text
  end
end

