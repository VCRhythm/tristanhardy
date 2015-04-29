class PostsController < ApplicationController
  before_action :set_tab
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :check_for_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
      @post = Post.new(post_params)
      @post.body = @post.body.html_safe
      short_body = @post.body.split('</p>')[0]
      @post.short_body = short_body.split('<p>')[1]
      set_tags

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render action: 'show', status: :created, location: @post }
        else
          format.html { render action: 'new' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      short_body = post_params[:body].split('</p>')[0]+'</p>'
      @post.short_body = short_body.split('<p>')[1]
      set_tags

      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_tab
      @active_tab = 1 
    end

    def check_for_admin
      if(!current_user.admin)
        redirect_to posts_url, alert: "'Quit screwin' around!"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def set_tags
      @tags = params[:tags].split(',');
      @tags.each do |tag|
        if(Tag.exists?(name:tag))
          newTag = Tag.where(name:tag).first
        else
          newTag = Tag.create(name:tag)
        end
        @post.tags << newTag
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :date)
    end
end
