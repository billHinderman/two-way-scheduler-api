module Api
  class UsersController < ApiController
    before_action :get_calendar_by_user_key,
    only: [
      :show_calendar_by_user_key
    ]

    private

    def get_calendar_by_user_key
      @calendar = User.find_by(key: params[:user_key]).calendar
    end
  end
end
