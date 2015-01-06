class Generator


  def num_of_first_names
    FirstName.count
  end

  def num_of_last_names
    LastName.count
  end

  def random_first_name_id
    rand(1..num_of_first_names)
  end

  def random_last_name_id
    rand(1..num_of_last_names)
  end

  def find_first_name_id
    FirstName.find(random_first_name_id)
  end


  def find_last_name_id
    LastName.find(random_last_name_id)
  end

  def first_name
    find_first_name_id.first_name
  end

  def last_name
    find_last_name_id.last_name
  end
end

