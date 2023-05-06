class RanksController < ApplicationController
    def rank
        # 投稿のいいね数ランキング
        @pastime_favorite_ranks = Pastime.find(Favorite.group(:pastime_id).order('count(post_id) desc').pluck(:pastime_id))
    end
end
