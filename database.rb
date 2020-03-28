class Database
  USERS = {
    1 => { name: 'john' },
    2 => { name: 'shefali' },
    3 => { name: 'larry' }
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

  def self.hobbies
    HOBBIES
  end

end

