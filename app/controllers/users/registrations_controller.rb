class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failed
  end

  def register_success
    render json: { message: 'Signed up.' }
  end

  def register_failed
    render json: { message: 'Sign up failure.' }
  end
end
