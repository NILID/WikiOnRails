class PagesController < ApplicationController
  load_and_authorize_resource

  def index
    @pages = @pages.with_translations(I18n.locale)
  end

  def show
    @sections = @page.sections.with_translations(I18n.locale)
  end

  def history
    @versions = @page.translation_for(I18n.locale).versions.reverse
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def page_params
#  params.fetch(:page, { translations_attributes: %i[id locale name] })
      params.require(:page).permit(
        { translations_attributes: %i[id locale name] }
      )

    end
end
