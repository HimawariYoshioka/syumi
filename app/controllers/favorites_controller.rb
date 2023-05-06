class FavoritesController < ApplicationController
    def create
        favorite = current_user.favorites.create(pastime_id: params[:pastime_id]) #user_idとpastime_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        favorite = Favorite.find_by(pastime_id: params[:pastime_id], user_id: current_user.id)
        favorite.destroy
        redirect_back(fallback_location: root_path)
      end

end
