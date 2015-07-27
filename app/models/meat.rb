class Meat < ActiveRecord::Base
  belongs_to :order, foreign_key: :order_id

  enum type: [:chicken, :meat, :sausage]
end
