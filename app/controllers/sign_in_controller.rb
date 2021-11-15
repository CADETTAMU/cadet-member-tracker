# frozen_string_literal: true

class SignInController < ApplicationController
  def index
    @members = Member.all
  end

  def show; end

  def new
    @member = Member.new
  end

  def edit; end

  def delete; end
end
