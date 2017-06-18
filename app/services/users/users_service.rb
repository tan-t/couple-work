module Users
module UsersService

module_function

  def find_or_create_if_not_exists(zaim_user)
    if User.exists?(zaim_id: zaim_user['id'])
      return User.where(zaim_id: zaim_user['id']).take
    end
    user = User.create(zaim_id: zaim_user['id'],name: zaim_user['name'])
    user.save
    return user
  end

end
end
