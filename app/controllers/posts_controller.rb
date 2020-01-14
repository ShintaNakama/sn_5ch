class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:show]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /posts
  # GET /posts.json
  def index
    @posts = if params[:search].present?
      Post.search(params[:search]).records
    else
      Post.includes(:categories).references(:all)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new(user_id:current_user.id)
  end

  # GET /posts/1/edit
  #def edit
  #end

  # POST /posts
  # POST /posts.json
  def create
    @post          = Post.new(post_params)
    @post.user_id  = current_user.id
    category_params[:category_name].each do |category_name|
      @post.categories << Category.find_or_initialize_by(category_name:category_name)
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  #def update
  #  respond_to do |format|
  #    if @post.update(post_params)
  #      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @post }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @post.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /posts/1
  # DELETE /posts/1.json
  #def destroy
  #  @post.destroy
  #  respond_to do |format|
  #    format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body)
    end

    def category_params
      params.require(:post).permit(category_name: [])
    end

end
