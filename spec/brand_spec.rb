require('spec_helper')

describe(Brand) do
  describe("#name") do
    it("returns the name of the brand") do
      test_brand = Brand.create({:name => "matthew"})

      expect(test_brand.name()).to(eq("matthew"))
    end
  end

  describe("#stores") do
    it("tells which stores they are sold in") do
      test_brand = Brand.create({:name => "Nike"})
      test_store = Store.create({:name => "nike outlet"})
      test_store2 = Store.create({:name => "rebock outlet"})
      test_brand.stores.push(test_store)

      expect(test_brand.stores()).to(eq([test_store]))
    end
  end
end
