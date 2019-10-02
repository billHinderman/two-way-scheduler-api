Rails.application.routes.draw do
  # API SUBDOMAIN
  constraints subdomain: 'api' do
    scope module: 'api' do
      # USERS
      scope '/users' do
        # USER/EMPLOYER
        # USER/TALENT
      end

      # USER/SELF
      scope '/self' do
      end

      # APPOINTMENTS
      scope '/appointments' do
      end

      # CALENDARS
      scope '/calendars' do
      end

      # INTERVIEWS
      scope '/interviews' do
      end

    end
  end
end
