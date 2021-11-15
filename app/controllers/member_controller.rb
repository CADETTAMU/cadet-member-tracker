class MemberController < ApplicationController
  before_action :set_sign_in, only: %i[ edit update destroy ]

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def delete
  end
  
  def update
    respond_to do |format|
      if @member.update(sign_in_params)
        format.html { redirect_to :new_member_session, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to :new_member_session, notice: "Member was successfully destroyed." }
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