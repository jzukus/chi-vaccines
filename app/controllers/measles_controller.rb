class MeaslesController < ApplicationController
  before_action :set_measle, only: [:show, :edit, :update, :destroy]

require 'csv'
  def import
    current_schools = Measle.all.count
    csv_text = File.read('measles.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      data = row.to_hash
      measle = Measle.find_or_create_by(:school_id => data['school_id'])
      measle.update_attributes(data)
    end
    updated_schools = Measle.all.count
    render html: "#{updated_schools - current_schools} schools imported!"
  end

  # GET /measles
  # GET /measles.json
  def index
    @measles = Measle.all
  end

  # GET /measles/1
  # GET /measles/1.json
  def show
  end

  # GET /measles/new
  def new
    @measle = Measle.new
  end

  # GET /measles/1/edit
  def edit
  end

  # POST /measles
  # POST /measles.json
  def create
    @measle = Measle.new(measle_params)

    respond_to do |format|
      if @measle.save
        format.html { redirect_to @measle, notice: 'Measle was successfully created.' }
        format.json { render :show, status: :created, location: @measle }
      else
        format.html { render :new }
        format.json { render json: @measle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measles/1
  # PATCH/PUT /measles/1.json
  def update
    respond_to do |format|
      if @measle.update(measle_params)
        format.html { redirect_to @measle, notice: 'Measle was successfully updated.' }
        format.json { render :show, status: :ok, location: @measle }
      else
        format.html { render :edit }
        format.json { render json: @measle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measles/1
  # DELETE /measles/1.json
  def destroy
    @measle.destroy
    respond_to do |format|
      format.html { redirect_to measles_url, notice: 'Measle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measle
      @measle = Measle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measle_params
      params.require(:measle).permit(:school_id, :district, :facility, :enrollment, :school_compliance, :compliance_bin, :protection, :protection_bin)
    end
end
