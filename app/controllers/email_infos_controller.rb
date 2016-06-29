class EmailInfosController < ApplicationController
  before_action :set_email_info, only: [:show, :edit, :update, :destroy]

  # GET /email_infos
  # GET /email_infos.json
  def index
    @email_infos = EmailInfo.all
  end

  # GET /email_infos/1
  # GET /email_infos/1.json
  def show
  end

  # GET /email_infos/new
  def new
    @email_info = EmailInfo.new
  end

  # GET /email_infos/1/edit
  def edit
  end

  # POST /email_infos
  # POST /email_infos.json
  def create
    @email_info = EmailInfo.new(email_info_params)

    respond_to do |format|
      if @email_info.save
        format.html { redirect_to @email_info, notice: 'Email info was successfully created.' }
        format.json { render :show, status: :created, location: @email_info }
      else
        format.html { render :new }
        format.json { render json: @email_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_infos/1
  # PATCH/PUT /email_infos/1.json
  def update
    respond_to do |format|
      if @email_info.update(email_info_params)
        format.html { redirect_to @email_info, notice: 'Email info was successfully updated.' }
        format.json { render :show, status: :ok, location: @email_info }
      else
        format.html { render :edit }
        format.json { render json: @email_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_infos/1
  # DELETE /email_infos/1.json
  def destroy
    @email_info.destroy
    respond_to do |format|
      format.html { redirect_to email_infos_url, notice: 'Email info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_info
      @email_info = EmailInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_info_params
      params.require(:email_info).permit(:email_id, :is_open, :is_click)
    end
end
