class Api::V1::SurveysController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :find_survey, only:[:create, :update, :show]

 	def create
   @survey = Survey.new(survey_params)
    if @survey.save
      render json: @survey, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end


  def update
    if @survey.update(survey_params)
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @survey
  end

  private

  def survey_params
    params.require(:survey).permit(:name, :description)
  end

  def find_survey
  	@survey = Survey.find(params[:id])
  end
end
