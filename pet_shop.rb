def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_amount)
  pet_shop[:admin][:total_cash] += cash_amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets_sold)
  pet_shop[:admin][:pets_sold] += number_of_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, pet_breed)
  pets = []
  for pet in pet_shop[:pets]
    if pet[:breed] == pet_breed
      pets.push(pet)
    end
  end
  return pets
end

def find_pet_by_name(pet_shop, pet_name)
  match = nil
  for pet in pet_shop[:pets]
    match = pet if pet[:name] == pet_name
  end
  return match
end

def remove_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet[:name] == pet_name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, pet)
  pet_shop[:pets].push(pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, pet_to_purchase)
  return customer[:cash] >= pet_to_purchase[:price]
  #   return true
  # else
  #   return false
  # end
end

def increment_pet_sold_counter(pet_shop)
  pet_shop[:admin][:pets_sold] += 1
end

def sell_pet_to_customer(pet_shop, pet, customer)
  return if pet == nil
  return if !customer_can_afford_pet(customer, pet)
  #if pet != nil && customer_can_afford_pet(customer, pet)
  remove_customer_cash(customer, pet[:price])
  add_or_remove_cash(pet_shop, pet[:price])
  remove_pet_by_name(pet_shop, pet[:name])
  add_pet_to_customer(customer, pet)
  increment_pet_sold_counter(pet_shop)
  #end
end
