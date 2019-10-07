module Api
  class AppointmentsController < ApiController
    before_action :get_appointment_by_key,
    only: [
      :show
    ]

    def index
      @appointments = Appointment.page(params[:page]).per(16)
      render json: @appointments,
      adapter: :json,
      each_serializer: AppointmentSerializer,
      meta: {
        first_page: @appointments.first_page?,
        last_page: @appointments.last_page?
      }
    end

    def confirmed_index
      @appointments = Appointment.confirmed.page(params[:page]).per(16)
      render json: @appointments,
      adapter: :json,
      each_serializer: AppointmentSerializer,
      meta: {
        first_page: @appointments.first_page?,
        last_page: @appointments.last_page?
      }
    end

    def show
      render json: @appointment,
      adapter: :json,
      serializer: AppointmentSerializer
    end

    def create
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
        render json: @appointment.key, status: :created
      else
        render json: { head: :no_content }, status: :unprocessable_entity
      end
    end

    private

    def get_appointment_by_key
      @appointment = Appointment.find_by(key: params[:appointment_key])
    end

    def appointment_params
      params.permit(
        :title,
        :length,
        :status,
        :start_at
      )
    end
  end
end
