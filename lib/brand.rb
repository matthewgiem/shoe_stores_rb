class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  before_save(:cap_letter)

  validates(:name, :presence => true)

  private
  define_method(:cap_letter) do
    self.name=(name().capitalize())
  end
end
