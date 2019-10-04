module Api
  class InterviewsController < ApiController
    before_action :get_interview_key,
    only: [
      :show
    ]

    def create
      @interview = Interview.new(interview_params)
      if (!current_user.nil?)
        @interview.requesting_employer = current_user
      end
      if @interview.save
        render json: @interview.key, status: :created
      else
        render json: { head: :no_content }, status: :unprocessable_entity
      end
    end

    private

    def get_interview_by_key
      if current_user.role = "employer"
        @interview = Interview.find_by(requesting_employer_id: current_user.id, key: params[:interview_key])
      else
        @interview = Interview.find_by(requestingtalent_id: current_user.id, key: params[:interview_key])
      end
    end

    def interview_params
      params.permit(
        :enable_at,
        :expire_at,
        :length,
        :slug
      )
    end
  end
end
