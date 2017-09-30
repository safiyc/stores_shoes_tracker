class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  # for some reason, this must be 101 characters before it returns false; 'brand.rb' returns false at 100 characters
  validates :store_name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 100}
  # this works too:
  # validates(:store_name, {:presence => true, :uniqueness => {:case_sensitive => false}, :length => {:maximum => 100}})
  before_save(:upcase_store_name)

  private

  def upcase_store_name
    self.store_name=(store_name().upcase())
  end
end
