require 'rails_helper'

RSpec.describe Order, model: true do
  context 'when a line item promo is triggered' do
    let!(:line_item) { create(:line_item) }
    let!(:adjustment) { create(:adjustment, line_item: line_item, order: line_item.order) }

    it 'updates line item final price' do
      expect(line_item.reload.final_price).to eq(line_item.price - adjustment.amount)
    end
  end
end
