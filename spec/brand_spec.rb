require("spec_helper")

describe(Brand) do

  it('returns inputted brand in uppercase') do
    brand1 = Brand.create({:brand_name => 'brand1'})
    expect(brand1.brand_name).to eq('BRAND1')
  end

  it('checks to disable blank inputs') do
    brand1 = Brand.create({:brand_name => ''})
    expect(brand1.save).to eq(false)
  end

  # it('returns inputted price into currency') do
  #   price1 = Brand.create({:price => 15})
  #   expect(price1.price).to eq('$15.00')
  # end
end
