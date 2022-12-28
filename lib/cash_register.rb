require 'pry'

class CashRegister
  attr_accessor :items, :total, :discount, :last_transaction

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.last_transaction = price * quantity
    quantity.times {self.items << title}
    self.total += price * quantity
  end

  def apply_discount
    if self.discount > 0
      self.total = total - (total * discount * 0.01).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
