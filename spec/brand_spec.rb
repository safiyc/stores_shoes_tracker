require("spec_helper")

describe(Brand) do

  it('returns inputted brand in uppercase') do
    brand1 = Brand.create({:brand_name => 'brand1'})
    expect(brand1.brand_name).to eq('BRAND1')
  end
end
