class User < ActiveRecord::Base
  validates :first_name, :last_name, :email,  presence: true
  has_many :addresses, :dependent => :destroy
  has_many :educations , :dependent => :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :educations, allow_destroy: true

  def as_json(options={})
    super(:include => [:addresses,:educations])
  end
  
end
