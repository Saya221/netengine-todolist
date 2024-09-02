# frozen_string_literal: true

class HealthchecksController < ApplicationController
  def ping
    render json: { message: "pong" }, status: :ok
  end
end
