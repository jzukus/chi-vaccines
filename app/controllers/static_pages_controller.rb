class StaticPagesController < ApplicationController
  def home
  end

  def vaccines_cps
  end

  def value_vaccines
  end

  def immunization_levels
    @measles = Measle.all
    @chart = @measles.order('protection desc')
    if params[:search].blank?
      @results = []
    else
      @parameter = params[:search].downcase
      @results = @measles.where("lower(facility) LIKE :search", search: "%#{@parameter}%")
    end
  end

  def clinic_finder
  end

  def about
  end
end
