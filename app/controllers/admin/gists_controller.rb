# frozen_string_literal: true

class Admin::GistsController < Admin::BaseController
  before_action :set_gists, only: :index
  before_action :set_gist, only: :destroy

  def index; end

  def destroy
    @gist.destroy
    redirect_to admin_gists_path, notice: t('.gist_deleted')
  end

  private

  def set_gists
    @gists = Gist.all
  end

  def set_gist
    @gist = Gist.find(params[:id])
  end
end
