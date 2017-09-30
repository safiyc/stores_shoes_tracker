class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand_name, {:presence => true, :uniqueness => {:case_sensitive => false}, :length => {:maximum => 100}})
  validates(:price, {:presence => true, :numericality => true})
  # below dry code works, but not sure how to include 'numericality'
  # validates_presence_of :brand_name, :price
  before_save(:upcase_brand_name)
  before_save(:currency_format)

  private

  def upcase_brand_name
    self.brand_name=(brand_name().upcase())
  end

  def currency_format
    # look up 'sprintf' to refresh
    # '.2' should make output display '0.00', but only showing '0.0'
    self.price = "%0.2f" % price
  end
end
