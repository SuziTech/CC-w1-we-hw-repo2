def pet_shop_name(defined_info)
  actual_pet_shop_name = defined_info[:name]
  # p actual_pet_shop_name
  return actual_pet_shop_name
end

def total_cash(defined_info)
  current_total_cash = defined_info[:admin][:total_cash]
  # p current_total_cash
  return current_total_cash
end

def add_or_remove_cash(defined_info, change_in_cash)
  current_cash = total_cash(defined_info)
  new_current_cash = current_cash + change_in_cash
  # p new_current_cash
  defined_info[:admin][:total_cash] = new_current_cash
  # p total_cash(defined_info)
end

def pets_sold(defined_info)
  number_of_pets_sold = defined_info[:admin][:pets_sold]
  # p number_of_pets_sold
  return number_of_pets_sold
end

def increase_pets_sold(defined_info, actual_number_of_pets_sold)
  current_num_pets_sold = pets_sold(defined_info)
  new_total_num_pets_sold = current_num_pets_sold + actual_number_of_pets_sold
  # p new_total_num_pets_sold
  defined_info[:admin][:pets_sold] = new_total_num_pets_sold
  # p pets_sold(defined_info)
end

def stock_count(defined_info)
  current_stock_count = defined_info[:pets].length
  # p current_stock_count
  return current_stock_count
end

def pets_by_breed(defined_info, passed_in_breed)
  pets_array = defined_info[:pets]
  pets_info_by_breed = []

  pets_array.each {
    | pet | pets_info_by_breed.push(pet) if pet[:breed] == passed_in_breed
  }
  # p pets_info_by_breed
  return pets_info_by_breed
end

def find_pet_by_name(defined_info, passed_in_name)
  pets_array = defined_info[:pets]
  #p passed_in_name
  found_pet_by_name = Hash.new
  found_pet_by_name[:name] = nil

  pets_array.each {
    | pet | if pet[:name] == passed_in_name
              found_pet_by_name[:name] = passed_in_name
            elsif pet[:name] != passed_in_name
              next
            else
              found_pet_by_name.reject! {|k, v| v.nil?}
              found_pet_by_name.reject! {|k, v| k.nil?}
            end
  }
  #p found_pet_by_name
  return found_pet_by_name
end

def remove_pet_by_name(defined_info, passed_in_name)
  pets_array = defined_info[:pets]
  # p passed_in_name

  pets_array.each {
    | pet | if pet[:name] != passed_in_name
              next
            elsif
              pet[:name] == passed_in_name
              p pet
              pets_array.delete(pet)
            else
              p pet + "none existent pet!"
            end
  }
end

def add_pet_to_stock(defined_info, pet_to_add)
  pets_array = defined_info[:pets]
  # p pets_array
  pets_array = pets_array.unshift(pet_to_add)
  # p pets_array
end

def customer_cash(defined_info)
  customers_current_cash = defined_info[:cash]
  return customers_current_cash
end

def remove_customer_cash(customer_ref, cash_to_deduct)
  return customer_ref[:cash] = customer_ref[:cash] - cash_to_deduct
end

def customer_pet_count(defined_info)
  return defined_info[:pets].count
end

def add_pet_to_customer(customer_ref, new_pet_reference)
  customer_ref[:pets] = customer_ref[:pets].unshift(new_pet_reference)
end
