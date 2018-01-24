class ApplicationController < ActionController::API
  private

  def authenticate
    # TODO
    # skipping
    @current_user = User.first
  end
end
