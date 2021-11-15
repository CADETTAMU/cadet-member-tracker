# frozen_string_literal: true

class SignInController < ApplicationController
  before_action :set_sign_in, only: %i[edit update destroy]

  def index
    @members = Member.all
  end

  def show; end

  def new
  end

  def edit; end

  def delete; end

  def update
  end

  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sign_in
    @member = Member.find(params[:id])
  end
end
