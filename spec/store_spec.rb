require('spec_helper')

describe(Store) do

  it('returns inputted store in uppercase') do
    store1 = Store.create({:store_name => 'store1'})
    expect(store1.store_name).to eq("STORE1")
  end

  it('checks to disable blank inputs') do
    store1 = Store.create({:store_name => ''})
    expect(store1.save).to eq(false)
  end
end
