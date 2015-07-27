class SideDish < ActiveRecord::Base
  belongs_to :order, foreign_key: :order_id

  enum type: [:pasta, :puree, :rice, :salad]
end
