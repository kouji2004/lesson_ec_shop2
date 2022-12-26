class Item < ApplicationRecord
 belongs_to :genre

def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
      item.with_tax_price * amount
  end

end
