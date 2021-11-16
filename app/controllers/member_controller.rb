# frozen_string_literal: true

class MemberController < ApplicationController
  before_action :set_sign_in, only: %i[edit update destroy]

  def index
  end

  def show; end

  def new
  end

  def edit; end

  def delete; end

  def update
    respond_to do |format|
      if @member.update(sign_in_params)
        format.html { redirect_to :new_member_session, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to :new_member_session, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sign_in
    @member = Member.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sign_in_params
    params.require(:member).permit(:full_name, :email, :is_admin)
  end
end
