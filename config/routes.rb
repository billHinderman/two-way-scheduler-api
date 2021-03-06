Rails.application.routes.draw do
  # API SUBDOMAIN
  constraints subdomain: 'api' do

    # USER AUTH
    mount_devise_token_auth_for 'User', at: 'auth'

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
        patch     '/:calendar_key',     controller: 'calendars',            action: 'update'
      end

      # INTERVIEWS
      scope '/interviews' do
        root                            controller: 'interviews',            action: 'index'
        get       '/confirmed',         controller: 'interviews',            action: 'confirmed_index'
        post      '/',                  controller: 'interviews',            action: 'create'
        get       '/:interview_key',    controller: 'interviews',            action: 'show'
        patch     '/:interview_key',    controller: 'interviews',            action: 'update'
      end

    end
  end
end
