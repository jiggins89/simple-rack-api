class Database
  USERS = {
    1 => { id: 1, name: 'john', api_key: '123' },
    2 => { id: 2, name: 'shefali', api_key: 'qwe' },
    3 => { id: 3, name: 'larry', api_key: '123' }
  }

  HOBBIES = {
    1 => { user_id: 1, name: 'surfing' },
    2 => { user_id: 2, name: 'saxaphone' },
    3 => { user_id: 3, name: 'chewing' }
  }

  def self.users(user_id)
    USERS.select { |index| index == user_id }
  end

  def self.add_user(user)
    index = (USERS.count + 1)
    USERS.merge!(index => { id: index, name: user["name"] })
  end

  def self.find_user_by_api_key(api_key)
    USERS.values.find { |user| user[:api_key] == api_key }
  end

  def self.hobbies
    HOBBIES
  end

end

