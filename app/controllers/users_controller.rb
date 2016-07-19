class UsersController < Clearance::UsersController

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def home
		@user = user_from_params
	end

private

 def user_from_params
 		name = user_params.delete(:name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)

    Clearance.configuration.user_model.new(user_params).tap do |user|
    	user.name = name
      user.email = email
      user.password = password
    end
  end


  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end
end