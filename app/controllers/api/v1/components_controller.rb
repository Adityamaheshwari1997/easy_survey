class Api::V1::ComponentsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_survey, only:[:create, :update, :destroy, :index ]
	before_action :set_component, only:[:update, :destroy]

	def index
		@components = @survey.components
		render json: @components
	end

	def create
		@component = @survey.components.build(component_params)
		if @component.save
			render json: @component, status: :created
		else
			render json: @component.errors, status: :unprocessable_entity
		end
	end

  def update
	  if @component.update(component_params)
	    render json: @component
	  else
	    render json: @component.errors, status: :unprocessable_entity
	  end
	end


  def destroy
    @component.destroy
    head :no_content
  end

  private

  def component_params
    params.require(:component).permit(:label, :input_text, :position_x, :position_y)
  end

  def set_survey
  	@survey = Survey.find(params[:survey_id])
  end

  def set_component
  	@component = @survey.components.find(params[:id])
  end
end
