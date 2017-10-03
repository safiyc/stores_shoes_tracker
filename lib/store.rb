class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  # length, after 100 characters limit, input is not accepted
  validates :store_name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 100}
  # this works too:
  # validates(:store_name, {:presence => true, :uniqueness => {:case_sensitive => false}, :length => {:maximum => 100}})
  before_save(:upcase_store_name)

  private

  def upcase_store_name
    self.store_name = store_name.split.map(&:capitalize).join(' ')
  end
end
