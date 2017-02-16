class User
  include Mongoid::Document
  field :username, type: String
  field :password, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :phone, type: String
  field :role, type: String
  field :description, type: String


  class << self
  	# Authentication with bcrypt
    def authentication(user_params)
      user = User.any_of({username: user_params[:username]},{email: user_params[:username]}).try(:first)
      raise if user.blank?
      password = user.password
      if user_params[:password] == password
      	return user
      else
      	return nil
      end
    rescue
      return nil
    end

  end
end
