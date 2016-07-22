require('spec_helper')

describe(Store) do
  describe("#brands") do
    it("tells which brands they are sold in the givin store") do
      test_brand = Brand.create({:name => "Nike"})
      test_brand2 = Brand.create({:name => "adidas"})
      test_store = Store.create({:name => "nike outlet"})
      test_store2 = Store.create({:name => "rebock outlet"})
      test_store.brands.push(test_brand)

      expect(test_store.brands()).to(eq([test_brand]))
    end
  end

  describe("#name") do
    it("returns the name of the store captolized") do
      test_store = Store.create({:name => "matthew"})

      expect(test_store.name()).to(eq("Matthew"))
    end
  end

end
