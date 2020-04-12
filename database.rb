class Database
  USERS = {
    1 => { name: 'john', api_key: '123' },
    2 => { name: 'shefali', api_key: 'qwe' },
    3 => { name: 'larry', api_key: 'asd' }
  }

  HOBBIES = {
    1 => { user_id: 1, name: 'surfing' },
    2 => { user_id: 2, name: 'saxaphone' },
    3 => { user_id: 3, name: 'chewing' }
  }

  def self.users
    USERS
  end

  def self.add_user(user)
    index = (USERS.count + 1)
    USERS.merge!(index => { name: user["name"] })
  end

  def self.find_user_by_api_key(api_key)
    USERS.each do |user|
      return user[0] if user[1].has_value?(api_key)
    end

    nil
  end

  def self.hobbies
    HOBBIES
  end

end

