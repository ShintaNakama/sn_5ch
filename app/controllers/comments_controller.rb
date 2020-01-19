class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /comments
  # GET /comments.json
  #def index
  #  @comments = Comment.all
  #end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    #@comment = Comment.new(post_params)
    #@comment = current_user.posts.new(id: post_params[:post_id]).comments.build
    #@post = Post.find(params[:post_id])
    @comment_registration_form = CommentRegistrationForm.new(post_params)
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment_registration_form = CommentRegistrationForm.new
    @comment_registration_form.comment = comment_params[:comment]
    @comment_registration_form.post_id = post_params[:post_id]
    @comment_registration_form.user_id = current_user.id

    @comment_registration_form.save!
    respond_to do |format|
        format.html { redirect_to post_path(@comment_registration_form.post_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
    end
  rescue
    format.html { render :new }
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def post_params
      params.permit(:post_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment_registration_form).permit(:comment)
    end
end
