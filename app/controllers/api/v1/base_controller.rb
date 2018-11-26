# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::Metal
      include AbstractController::Rendering
      include ActionView::Layouts
      append_view_path "#{Rails.root}/app/views/api/v1"
    end
  end
end
