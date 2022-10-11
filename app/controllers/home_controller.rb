# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def log_out
    sign_out current_user
    redirect_to root_path
  end
end
