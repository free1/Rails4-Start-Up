# encoding=utf-8
module V1
  module WeiXin
    class Products < Grape::API
      version 'v1', using: :path

      resource :products, desc: '演出' do
        
        desc '列表'
        params do
          optional :page, type: Integer, default: 1
          optional :per_page, type: Integer, default: 10
        end
        get do
          posts = Product.order(id: :desc).paginate(page: params[:page], per_page: params[:per_page])

          present posts, with: V1::Entities::Products
        end
      end

    end
  end
end
