class VerificationSessionsController < ApplicationController
  def create
    user = current_user
    document = Document.find(params[:document])
    photos = Photo.find_by(document_id: params[:document])

    InitVerificationSession.new(user, document, photos).call

    redirect_to rental_path(current_user.rentals.last.id)
  end
end
