class Basket
  BOOK_PRICE = 8
  DISCOUNTS = { 0 => 1, 1 => 1, 2 => 0.95, 3 => 0.9, 4 => 0.8, 5 => 0.75}

  def initialize(books)
    @books = books.group_by {|b| b if b == b }
  end

   # [[0, 1, 2, 3, 4], [1], [], [], [], []]
   # [[0, 1, 2, 3, 4], [0, 1, 2], [], [], [], []]

   # [[0, 1, 2, 3, 4],
   # [0, 1, 2, 3, 4],
   # [0, 1, 2, 3, 4],
   # [0, 1, 2, 3, 4],
   # [0, 1, 3],
   # []]
  def price
    collections.map {|set| set.size * BOOK_PRICE * DISCOUNTS[set.size] }.inject(:+)
  end

  private

  def collections
    Array.new.tap do |collections|
      DISCOUNTS.keys.each do |i|
         collections[i] = Array.new
         @books.values.each { |set| collections[i] << set.shift if set.any? }
      end
    end
  end
end
