class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:brand_name, :presence => true)
  before_save(:upcase_brand_name)

  private

  def upcase_brand_name
    self.brand_name=(brand_name().upcase())
  end

  # def currency_format
  #   self.price=(price.gsub(/))
  # end
end
