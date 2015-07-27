class SideDish < ActiveRecord::Base
  enum type: [:pasta, :puree, :rice, :salad]
end
