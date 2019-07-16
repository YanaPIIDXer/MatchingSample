class UserSearchController < AuthPageController
  def index
    if checkAndRedirectToError()
      return
    end
  end

  def result
    if checkAndRedirectToError()
      return
    end

    @name = params[:name]
    @detail = params[:detail]
    @ageMin = params[:age_min].to_i()
    @ageMax = params[:age_max].to_i()
    if @ageMin > @ageMax
      redirect_to "/user_search", :alert => "年齢の最小値が年齢の最大値を超えています。"
      return
    end
    
    @users = User.where("user_id <> ?", session[:user_id])

    if params[:name] != ""
      @users = @users.where("name like ?", "%#{@name}%")
    end

    if params[:detail] != ""
      @users = @users.where("detail like ?", "%#{@detail}%")
    end

    @users = @users.where("age >= ? and age <= ?", @ageMin, @ageMax)

    @userCount = @users.length

    @page = 1
    if params[:page]
      @page = params[:page].to_i()
    end

    @maxPage = (@userCount / 20) + 1
    @users = @users.limit(20).offset((@page - 1) * 20)
  end
end
