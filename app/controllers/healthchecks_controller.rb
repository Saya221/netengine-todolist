# frozen_string_literal: true

class HealthchecksController < ApplicationController
  def ping
    # Another test
    render json: { message: "pong" }, status: :ok
  end
end
