class FarMar::Product
  attr_reader :product_id, :name, :vendor_id
  
  def self.read_csv(file)
    CSV.read(file, 'r')
  end

  FILE = "./support/products.csv"
  PRODUCT_CSV = FarMar::Product.read_csv(FILE)

  def initialize(csv_index)
    @product_id = PRODUCT_CSV[csv_index][0].to_i
    @name = PRODUCT_CSV[csv_index][1]
    @vendor_id = PRODUCT_CSV[csv_index][2].to_i
  end

  def self.all
    allproducts = []
    PRODUCT_CSV.length.times do |index|
      allproducts << FarMar::Product.new(index)
    end
    return allproducts
  end

  def self.find(id)
    the_product = []
    PRODUCT_CSV.each do |product|
      if product[0].to_i == id.to_i
        the_product = product
      end
    end
    index = PRODUCT_CSV.index(the_product)
    return FarMar::Product.new(index)
  end
end
