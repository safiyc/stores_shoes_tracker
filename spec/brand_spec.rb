require("spec_helper")

describe(Brand) do

  it('returns inputted brand in uppercase') do
    brand1 = Brand.create({:brand_name => 'brand1', :price => 15})
    expect(brand1.brand_name).to eq('BRAND1')
  end

  it('checks to disable blank inputs') do
    brand1 = Brand.create({:brand_name => ''})
    expect(brand1.save).to eq(false)
  end

  # rspec passes to give float '15.0', but unable to get to display trailing zeros (ex. 15.00)
  # computer understands '15.0' as '15.00'
  # '$' sign is part of index html code
  # will commit when able to display 15.00
  it('returns inputted price into currency') do
    price1 = Brand.create({:price => 15})
    expect(price1.price).to eq(15.00)
  end

  it('disables duplicate name') do
    brand1 = Brand.create({:brand_name => 'brand1'})
    brand2 = Brand.create({:brand_name => 'brand1'})
    expect(brand2.save).to eq(false)
  end

  it('doesnt allow more than 100 characters in name') do
    brand1 = Brand.create({:brand_name => 'brandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrandbrand'})
    expect(brand1.save).to eq(false)
  end
end
