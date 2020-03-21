class Drink
  attr_reader :name, :price, :stock

  def initialize(**params)
    @name = params[:name]
    @price = params[:price]
    @stock = params[:stock]
  end
end