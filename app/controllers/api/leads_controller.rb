class Api::LeadsController < ApplicationController
  def create
    lead = Lead.create(lead_params.merge(delivery_status: :unsent))
    if lead.valid?
      # TODO: Sending of the lead should be triggered at this point
      render status: :created, json: { lead: lead }
    else
      render status: :bad_request, json: { errors: lead.errors.full_messages }
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:email)
  end
end
