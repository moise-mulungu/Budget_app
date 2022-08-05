# frozen_string_literal: true

class SplashesController < ApplicationController
  # GET /splashes or /splashes.json
  def index
    redirect_to categories_path if user_signed_in?
  end
end
