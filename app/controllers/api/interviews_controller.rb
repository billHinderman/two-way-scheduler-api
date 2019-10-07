module Api
  class InterviewsController < ApiController
    before_action :get_interview_by_key,
    only: [
      :show
    ]

    def index
      @interviews = Interview.page(params[:page]).per(16)
      render json: @interviews,
      adapter: :json,
      each_serializer: InterviewSerializer,
      meta: {
        first_page: @interviews.first_page?,
        last_page: @interviews.last_page?
      }
    end

    def confirmed_index
      @interviews = Interview.confirmed.page(params[:page]).per(16)
      render json: @interviews,
      adapter: :json,
      each_serializer: InterviewSerializer,
      meta: {
        first_page: @interviews.first_page?,
        last_page: @interviews.last_page?
      }
    end

    def show
      render json: @interview,
      adapter: :json,
      serializer: InterviewSerializer
    end

    def create
      if (current_user.nil? || current_user.role != "employer")
        render json: { head: :no_content }, status: :unauthorized
      end
      @interview = Interview.new(interview_params)
      if @interview.save
        render json: @interview.key, status: :created
      else
        render json: { head: :no_content }, status: :unprocessable_entity
      end
    end

    private

    def get_interview_by_slug
      if current_user.role = "employer"
        @interview = Interview.find_by(requesting_employer_id: current_user.id, slug: params[:interview_slug])
      else
        @interview = Interview.find_by(requesting_talent_id: current_user.id, slug: params[:interview_slug])
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
