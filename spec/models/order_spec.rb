require 'rails_helper'

RSpec.describe Order, model: true do
  let!(:order) { create(:order) }
  let(:product_gr1) { create(:product, sku: 'GR1', price: 3.11) }
  let(:product_sr1) { create(:product, sku: 'SR1', price: 5.00) }
  let(:product_cf1) { create(:product, sku: 'CF1', price: 11.23) }

  describe 'challenge expectations' do
    context 'when order contains GR1, GR1' do
      before do
        order.add_product(product_gr1, 2)
      end

      it 'calculate the amount correctly' do
        expect(order.total).to eq 3.11
      end
    end

    context 'when order contains SR1, SR1, GR1, SR1' do
      before do
        order.add_product(product_sr1, 2)
        order.add_product(product_gr1)
        order.add_product(product_sr1)
      end

      it 'calculate the amount correctly' do
        expect(order.total).to eq 16.61
      end
    end

    context 'when order contains GR1, CF1, SR1, CF1, CF1' do
      before do
        order.add_product(product_gr1)
        order.add_product(product_cf1)
        order.add_product(product_sr1)
        order.add_product(product_cf1, 2)
      end

      it 'calculate the amount correctly' do
        expect(order.total).to eq 30.57
      end
    end
  end

  context 'when a product is added to the order' do
    let(:product) { create(:product) }

    it 'updates the order total' do
      expect { order.add_product(product) }.to change { order.reload.total }.from(0).to(product.price)
    end
  end

  context 'when an adjustment is added to the order' do
    let(:product) { create(:product) }
    let!(:adjustment) { create(:adjustment, order: order) }
    let!(:line_item) { create(:line_item, order: order, product: product) }

    it 'updates the order total' do
      order.update_total
      expect(order.total).to eq(product.price - adjustment.amount)
    end
  end

  context 'when an adjustment is added to a line item' do
    let(:product) { create(:product) }
    let!(:line_item) { create(:line_item, order: order, product: product) }
    let!(:adjustment) { create(:adjustment, order: order, line_item: line_item) }

    it 'updates the order total' do
      order.update_total
      expect(order.total).to eq(line_item.final_price)
    end
  end

  context 'when a line item promo is triggered' do
    context 'and the same line item is added to the cart' do
      it 'doesn\'t apply the same promo twice' do
        order.add_product(product_gr1, 2)
        expect(order.adjustments.count).to eq(1)
        order.add_product(product_gr1, 2)
        expect(order.adjustments.count).to eq(1)
      end
    end
  end
end
