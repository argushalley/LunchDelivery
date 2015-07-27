class Meat < ActiveRecord::Base
  enum type: [:chicken, :meat, :sausage]
end
