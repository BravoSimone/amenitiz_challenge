require 'rails_helper'

RSpec.describe Order, model: true do
  describe "#apply" do
    let(:order) { create(:order) }
    let(:promo) { build(:promo, rule_class: rule_class, order: order) }
    let(:rule_class) { 'FakeRule' }
    let(:rule_instance) { double(:rule_instance, apply: true) }

    subject { promo.apply }

    it 'uses the correct classe to calculate the discount' do
      expect(FakeRule).to receive(:new) { rule_instance }
      expect(rule_instance).to receive(:apply).with(1)
      subject
    end

    context 'when the rule class is not implemented' do
      let(:rule_class) { 'NotImplementedRule' }

      it 'raises an error' do
        expect { subject }.to raise_error
      end
    end
  end
end

class FakeRule; end
