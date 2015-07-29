ActiveRecord::Base.transaction do
  # Carnes
  Meat.create!(name: 'Carne')
  Meat.create!(name: 'Frango')
  Meat.create!(name: 'Linguiça')

  # Acompanhamentos
  SideDish.create!(name: 'Arroz')
  SideDish.create!(name: 'Macarrão')
  SideDish.create!(name: 'Purê')
  SideDish.create!(name: 'Salada')
end
