class UsersController < ApplicationController
    def show
        #find a user in the databsae using the user ID from the session hash
        user = User.find_by(id: session[:user_id])
        #return the user as a json object
        if user 
            render json: user
            #optional error handling
        else 
            render json: {error: "Not authorized"}, status: :unauthorized
        end
    end
end
