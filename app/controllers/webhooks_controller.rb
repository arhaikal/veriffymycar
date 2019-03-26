class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
      receive_veriff
      render :text => '{}', :status => :ok
  end

  private

  def receive_veriff
    signature = request.headers["x-signature"]

    if VeriffBaseApi.is_signature_valid?(signature, request.body.read)
      VeriffActions.update_session_status(JSON.parse(request.body.read))
      render json: {status: "success"}, status: 200
    else
      render json: {status: "fail"}, status: 404
    end
  end
end
