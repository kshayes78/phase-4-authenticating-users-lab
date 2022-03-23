class SessionsController < ApplicationController

    def create
        #find a user in the db using the username from params
        user = User.find_by(username: params[:username])
        #saves the user's id to the session hash
        session[:user_id] = user.id
        #return(renders) the user as a json object
            render json: user
    
    end

    def destroy
        #remove the user ID from the session hash
        session.delete :user_id
        #return an empty response with a 204 no content status code. 
        head :no_content

    end
end
