class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:store_name, :presence => true)
  before_save(:upcase_store_name)

  private

  def upcase_store_name
    self.store_name=(store_name().upcase())
  end
end
