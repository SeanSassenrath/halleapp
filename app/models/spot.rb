class Spot < ActiveRecord::Base
  def change
    belongs_to :user
  end
end
