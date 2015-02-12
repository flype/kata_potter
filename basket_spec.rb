require 'rspec'
require './basket'

describe 'A bookstore basket' do
  describe 'when empty' do
    let(:basket) { [] }

    it 'cost 0 euros' do
      expect(basket_price).to eq(0)
    end
  end

  describe 'with 1 book' do
    let(:basket) { [1] }

    it 'cost 8 euros' do
      expect(basket_price).to eq(8)
    end
  end

  describe 'with 2 similar books' do
    let(:basket) { [1, 1] }

    it 'cost 16 euros' do
      expect(basket_price).to eq(16)
    end
  end

  describe 'with 3 similar books' do
    let(:basket) { [0, 0, 0] }

    it 'cost 24 euros' do
      expect(basket_price).to eq(24)
    end
  end

  describe 'with 2 differents books' do
    let(:basket) { [0, 1] }

    it 'cost 15,2 euros' do
      expect(basket_price).to eq(8 * 2 * 0.95)
    end
  end

  describe 'with 3 differents books' do
    let(:basket) { [0, 1, 2] }

    it 'cost 21.6 euros' do
      expect(basket_price).to eq(8 * 3 * 0.9)
    end
  end

  describe 'with 4 differents books' do
    let(:basket) { [0, 1, 2, 3] }

    it 'cost 32 euros' do
      expect(basket_price).to eq(8 * 4 * 0.8)
    end
  end

  describe 'with 5 differents books' do
    let(:basket) { [0, 1, 2, 3, 4] }

    it 'cost 30 euros' do
      expect(basket_price).to eq(8 * 5 * 0.75)
    end
  end

  describe 'with a combo of 2 copies of the same book and one from the other' do
    let(:basket) { [0, 0, 1] }

    it 'cost 22,4 euros' do
      expect(basket_price).to eq(8 + (8 * 2 * 0.95))
    end
  end

  describe 'with a 4 books, 2 and 2 copies' do
    let(:basket) { [0, 0, 1, 1] }

    it 'cost 30,4 euros' do
      expect(basket_price).to eq(2*(8 * 2 * 0.95))
    end
  end

  describe 'with a combo of two sets of discounts' do
    let(:basket) { [0, 0, 1, 2, 2, 3] }

    it 'cost 30,4 euros' do
      expect(basket_price).to eq((8 * 4 * 0.8) + (8 * 2 * 0.95))
    end
  end

  describe 'with a combo of two sets of discounts' do
    let(:basket) { [0, 1, 1, 2, 3, 4] }

    it 'cost 38 euros' do
      expect(basket_price).to eq(8 + (8 * 5 * 0.75))
    end
  end

  describe 'with a combo of two sets of discounts' do
    let(:basket) { [0, 0, 1, 1, 2, 2, 3, 4] }

    xit 'cost 51.2 euros' do
      expect(basket_price).to eq(2 * (8 * 4 * 0.8))
    end
  end

  describe 'with a combo of two sets of discounts' do
    let(:basket) { [0, 0, 0, 0, 0,
               1, 1, 1, 1, 1,
               2, 2, 2, 2,
               3, 3, 3, 3, 3,
               4, 4, 4, 4] }

    xit 'cost 51.2 euros' do
      expect(basket_price).to eq(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8))
    end
  end
end

def basket_price
  Basket.new(basket).price
end
