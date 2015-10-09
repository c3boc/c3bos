class Api::V1::BaseController < ActionController::Metal
  include AbstractController::Rendering
  include ActionView::Layouts
  append_view_path "#{Rails.root}/app/views/api/v1"

end
