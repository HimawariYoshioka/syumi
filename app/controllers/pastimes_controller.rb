class PastimesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    
    def index
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
       @pastimes = Pastime.joins(:user).where("genre LIKE ? OR hobby LIKE ? OR time LIKE ? OR price LIKE ? OR number LIKE ? OR comment LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
       
      else
       @pastimes = Pastime.all

       
       
      end
    
    end
    
    def top
     # 投稿のいいね数ランキング
     @rank_pastimes = Pastime.all.sort {|a,b| b.favorited_users.count <=> a.favorited_users.count}.first(3)
    end
  
    

    def suports
      @suports = Pastime.where(category:"suports") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def kansens
      @kansens = Pastime.where(category:"kansens") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def travels
      @travels = Pastime.where(category:"travels") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def outdoor
      @outdoors = Pastime.where(category:"outdoor") #ここがポイント！categoryのバリューがoutdoorの投稿を取得！
    end

    def gurumes
      @gurumes = Pastime.where(category:"gurumes") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end
  
    def cooks
      @cooks = Pastime.where(category:"cooks") #ここがポイント！categoryのバリューがoutdoorの投稿を取得！
    end

    def makes
      @makes = Pastime.where(category:"makes") #ここがポイント！categoryのバリューがcatの投稿を取得！
    end

    def sodaterus
      @sodaterus = Pastime.where(category:"sodaterus") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def musics
      @musics = Pastime.where(category:"musics") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def arts
      @arts = Pastime.where(category:"arts") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def dances
      @dances = Pastime.where(category:"dances") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def games
      @games = Pastime.where(category:"games") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def entames
      @entames = Pastime.where(category:"entames") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def gyanbuls
      @gyanbuls = Pastime.where(category:"gyanbuls") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def biyous
      @biyous = Pastime.where(category:"biyous") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def studies
      @studies = Pastime.where(category:"studies") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def earns
      @earns = Pastime.where(category:"earns") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def collections
      @collections = Pastime.where(category:"collections") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def volunteers
      @volunteers = Pastime.where(category:"volunteers") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end

    def others
      @others = Pastime.where(category:"others") #ここがポイント！categoryのバリューがdogの投稿を取得！
    end
    
    def new
        @pastime = Pastime.new
    end
    def create
        pastime = Pastime.new(pastime_params)

        pastime.user_id = current_user.id 

        if pastime.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @pastime = Pastime.find(params[:id])
        @comments = @pastime.comments
        @comment = Comment.new
      end

    def edit
        @pastime = Pastime.find(params[:id])
    end

    def update
        pastime = Pastime.find(params[:id])
        if pastime.update(pastime_params)
          redirect_to :action => "show", :id => pastime.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        pastime = Pastime.find(params[:id])
        pastime.destroy
        redirect_to action: :index
    end

  private
  def pastime_params
    params.require(:pastime).permit(:genre, :hobby, :time, :price, :number, :comment, :image, :content, :comment, :category)
  end


end

