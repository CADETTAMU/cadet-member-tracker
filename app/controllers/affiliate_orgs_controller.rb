# frozen_string_literal: true

class AffiliateOrgsController < ApplicationController
  before_action :set_affiliate_org, only: %i[show edit update destroy]

  # GET /affiliate_orgs or /affiliate_orgs.json
  def index
    @affiliate_orgs = AffiliateOrg.all
  end

  # GET /affiliate_orgs/1 or /affiliate_orgs/1.json
  def show; end

  # GET /affiliate_orgs/new
  def new
    @affiliate_org = AffiliateOrg.new
  end

  # GET /affiliate_orgs/1/edit
  def edit; end

  # POST /affiliate_orgs or /affiliate_orgs.json
  def create
    @affiliate_org = AffiliateOrg.new(affiliate_org_params)

    respond_to do |format|
      if @affiliate_org.save
        format.html { redirect_to @affiliate_org, notice: 'Affiliate org was successfully created.' }
        format.json { render :show, status: :created, location: @affiliate_org }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @affiliate_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affiliate_orgs/1 or /affiliate_orgs/1.json
  def update
    respond_to do |format|
      if @affiliate_org.update(affiliate_org_params)
        format.html { redirect_to @affiliate_org, notice: 'Affiliate org was successfully updated.' }
        format.json { render :show, status: :ok, location: @affiliate_org }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @affiliate_org.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliate_orgs/1 or /affiliate_orgs/1.json
  def destroy
    @affiliate_org.destroy
    respond_to do |format|
      format.html { redirect_to affiliate_orgs_url, notice: 'Affiliate org was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_affiliate_org
    @affiliate_org = AffiliateOrg.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def affiliate_org_params
    params.require(:affiliate_org).permit(:org_name, :org_link, :org_desc)
  end
end
