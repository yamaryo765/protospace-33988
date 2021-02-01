class PrototypesController < ApplicationController
  before_action :authenticate_user!,except: [:show,:index]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @prototype = Prototype.find(params[:id]) 
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user) #21と22行目(1)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless @prototype.user_id == current_user.id
      redirect_to action: :index
    end  
  end
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to action: :show
    else
      @prototype = Prototype.find(params[:id])
      render :edit
    end
  end
  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:catch_copy, :image,:title,:concept).merge(user_id: current_user.id)
  end 
  
end

#prototypecontrollerで定義したshowアクションでcomments_controllerで定義したインスタンス変数を使うためには（@comment),showアクション
#で呼び出す記述が必要(1)

#記述が正しくて,No method errorを起こしたら、(1)を使いたい場所の記述ミスを疑うべし。(前後の記述も含めて)