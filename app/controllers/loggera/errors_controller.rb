module Loggera
  class ErrorsController < ApplicationController
    def index
      @pagy, @errors = pagy Loggera::Error.all

      respond_to do |format|
        format.html { render :index }
        format.json do
          render json: { 
            entries: render_to_string(
              @errors,
              formats: [:html]
            ), pagination: view_context.pagy_nav(@pagy)
          }
        end
      end
    end
  end
end