class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update]
  before_action :authenticate_user!, only: [:index, :update]
  before_action :check_for_admin, only: [:index, :update]

  def index
    @tags = Tag.all
  end

  def show
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_path, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def tag_params
    params.require(:tag).permit(:name, :category)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  def check_for_admin
    if(!current_user.admin)
      redirect_to posts_url, alert: "'Quit screwin' around!"
    end
  end
end
