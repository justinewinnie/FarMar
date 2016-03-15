require_relative './spec_helper'
require_relative '../farmar'

describe "FarMar::Sale" do
  let(:sale) {FarMar::Sale.new(1)}
  describe "FarMar::Sale#all" do
    it "returns new instances of Sale for each entry in csv" do
      assert_equal (FarMar::Sale.all).length, FarMar::Sale::SALE_CSV.length
    end

    it "returns instances of Sale" do
      assert_equal (FarMar::Sale.all)[1].class, FarMar::Sale
    end
  end

  describe "FarMar::Sale#find" do
    it "returns an instance of Sale" do
      sale = FarMar::Sale.find(2)
      sale.must_be_instance_of FarMar::Sale
    end

    it "finds the requested sale by matching id" do
      sale = FarMar::Sale.find(2)
      assert_equal 2, sale.sale_id
    end
  end

  #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
  describe "FarMar::Sale#vendor" do
    it "returns the vendor associated with this sale" do
      sale.vendor.must_be_instance_of FarMar::Vendor
    end
  end
end
