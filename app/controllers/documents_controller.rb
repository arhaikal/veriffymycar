class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to rental_path(current_user.rentals.last.id)
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  private

  def document_params
    params.require(:document).permit(
        :number, :document_type, :country, :valid_from, :valid_until, :user_id
      )
  end
end