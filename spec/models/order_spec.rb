require 'rails_helper'

RSpec.describe Order, model: true do
  let(:order) { create(:order) }

  describe 'challenge expectations' do
    context 'when order contains GR1, GR1' do
      before do
        order.add_product(Product.find_by(sku: 'GR1'), 2)
      end

      it 'calculate the amount correctly' do
        expect(order.total).to eq 3.11
      end
    end

    context 'when order contains SR1, SR1, GR1, SR1' do
      before do
        order.add_product(Product.find_by(sku: 'SR1'), 2)
        order.add_product(Product.find_by(sku: 'GR1'))
        order.add_product(Product.find_by(sku: 'SR1'))
      end

      it 'calculate the amount correctly' do
        expect(order.total).to eq 16.61
      end
    end

    context 'when order contains GR1, CF1, SR1, CF1, CF1' do
      before do
        order.add_product(Product.find_by(sku: 'GR1'))
        order.add_product(Product.find_by(sku: 'CF1'))
        order.add_product(Product.find_by(sku: 'SR1'))
        order.add_product(Product.find_by(sku: 'CF1', 2))
      end

      it 'calculate the amount correctly' do
        expect(order.total).to eq 30.57
      end
    end
  end
end
