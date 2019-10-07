module Api
  class CalendarsController < ApiController
    before_action :get_calendar_by_user_key,
    only: [
      :show_calendar_by_user_key
    ]

    def show_calendar_self
      if (current_user.nil?)
        render json: { head: :no_content }, status: :unauthorized
      else
        render json: current_user.calendar,
        adapter: :json,
        serializer: CalendarSerializer
      end
    end

    def show_calendar_by_user_key
      render json: @calendar,
      adapter: :json,
      serializer: CalendarSerializer
    end

    def update
      if @calendar.update(calendar_params)
        render json: @calendar, status: :ok
      else
        render json: @calendar.errors, status: :unprocessable_entity
      end
    end

    private

    def get_calendar_by_key
      @calendar = Calendar.find_by(key: params[:key])
    end

    def get_calendar_by_user_key
      @calendar = User.find_by(key: params[:user_key]).calendar
    end

    def calendar_params
      params.permit(
        :payload, array: [:start, :end, :status]
      )
    end
  end
end
