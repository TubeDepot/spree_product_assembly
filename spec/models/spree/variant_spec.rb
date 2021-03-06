require 'spec_helper'

module Spree
  describe Variant do
    context "filter assemblies" do
      let(:mug) { create(:product) }
      let(:tshirt) { create(:product) }
      let(:variant) { create(:variant) }

      context "variant has more than one assembly" do
        before { variant.assemblies.push [mug, tshirt] }

        it "returns both products" do
          variant.assemblies_for([mug, tshirt]).should == [mug, tshirt]
        end
      end

      context "variant no assembly" do
        it "returns both products" do
          variant.assemblies_for([mug, tshirt]).should be_empty
        end
      end
    end
  end
end
