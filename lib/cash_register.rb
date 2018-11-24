require 'pry'

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(item, price, quantity = 1)
    item_info = {}
    item_info[:name] = item
    item_info[:price] = price
    item_info[:quantity] = quantity

    @cart << item_info

    @total += price * quantity
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total -= @total * @discount / 100
    return "After the discount, the total comes to $#{@total}."
  end

  def items
    list = []
    @cart.each do |info|
      for item in 1..info[:quantity]
        list << info[:name]
      end
    end
    list
  end

  def void_last_transaction
    @cart.each do |info|
      @total = @total - info[:price]
    end
    @total
  end

end
