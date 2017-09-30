class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand_name, :presence => true)
  validates(:price, {:presence => true, :numericality => true})
  # below dry code works, but not sure how to include 'numerciality'
  # validates_presence_of :brand_name, :price
  before_save(:upcase_brand_name)
  before_save(:currency_format)

  private

  def upcase_brand_name
    self.brand_name=(brand_name().upcase())
  end

  def currency_format
    # look up 'sprintf' to refresh
    self.price = "%0.2f" % price
  end
end
