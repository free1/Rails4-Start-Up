module V1
  module Entities
    class Products < Grape::Entity
      expose :id, :title, :location, :show_time, :price, :watch_count, :cover_path
    end
  end
end
