class Drink
  attr_accessor :stock
  attr_reader :name, :price

  def initialize(**params)
    @name = params[:name]
    @price = params[:price]
    @stock = params[:stock]
  end
end

