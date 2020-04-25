class SectionsController < ApplicationController
  load_and_authorize_resource :page
  load_and_authorize_resource :section, through: :page

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @section.save
        format.html { redirect_to @page, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @page, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to @page, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def section_params
      params.require(:section).permit(
        :page_id,
        :position,
        { translations_attributes: %i[id locale name content] }
      )
    end
end
