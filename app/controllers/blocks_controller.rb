class BlocksController < ApplicationController
  load_and_authorize_resource :page
  load_and_authorize_resource :block, through: :page

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @block.save
        format.html { redirect_to @page, notice: 'Block was successfully created.' }
        format.json { render :show, status: :created, location: @block }
      else
        format.html { render :new }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @page, notice: 'Block was successfully updated.' }
        format.json { render :show, status: :ok, location: @block }
      else
        format.html { render :edit }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to @page, notice: 'Block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def block_params
      params.require(:block).permit(
        :page_id,
        :position,
        { translations_attributes: %i[id locale name content] }
      )
    end
end
