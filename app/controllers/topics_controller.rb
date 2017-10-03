class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:edit, :update, :destroy, :show]

  def index
    @topics = Topic.all.order("id DESC")
    @topic = Topic.new
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
    @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
    redirect_to topics_path, notice:"Topicを作成しました！"
    NoticeMailer.sendmail_topic(@topic).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # edit, update, destroyで共通コード
    if @topic.update(topics_params)
      redirect_to topics_path, notice: "ブログを更新しました！"
    else
      render 'edit'
    end
  end

  def complete
    @topic.image.retrieve_from_cache! params[:cache][:image]
    @topic.save!
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "Topicを削除しました！"
  end

  def confirm
    @topic = Topic.new(topics_params)
    @user = User.find(current_user.id)

    render:new if @topic.invalid?
  end

  private
  def topics_params
    params.require(:topic).permit(:title, :content,:image)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
