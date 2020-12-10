require 'pry'

class CashRegister

    attr_accessor :total, :discount, :cart, :receipt

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @receipt = [] 
    end

    def add_item(title, price, quantity = 1)
        quantity.times { |i| @cart << title }
        self.receipt << price * quantity
        self.total += price * quantity
    end

    def apply_discount
        if self.discount == 20
        self.total = self.total - (self.total * (self.discount.to_f * 0.01))
            return "After the discount, the total comes to $#{self.total.round()}."
        else 
            return "There is no discount to apply."
        end
    end
    
    def items
        self.cart
    end
    
    def void_last_transaction
        self.total -= @receipt.pop
        # binding.pry
    end

end

