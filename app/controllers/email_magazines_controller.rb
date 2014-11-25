class EmailMagazinesController < ApplicationController
  before_action :set_email_magazine, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @email_magazines = EmailMagazine.all
    respond_with(@email_magazines)
  end

  def show
    respond_with(@email_magazine)
  end

  def new
    @email_magazine = EmailMagazine.new
    respond_with(@email_magazine)
  end

  def edit
  end

  def create
    @email_magazine = EmailMagazine.new(email_magazine_params)
    @email_magazine.save
    respond_with(@email_magazine)
  end

  def update
    @email_magazine.update(email_magazine_params)
    respond_with(@email_magazine)
  end

  def destroy
    @email_magazine.destroy
    respond_with(@email_magazine)
  end

  private
    def set_email_magazine
      @email_magazine = EmailMagazine.find(params[:id])
    end

    def email_magazine_params
      params.require(:email_magazine).permit(:title)
    end
end
