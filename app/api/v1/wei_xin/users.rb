# encoding=utf-8
module V1
  module WeiXin
    class Users < Grape::API
      version 'v1', using: :path

      resource :users, desc: '用户' do

        desc '发送验证码'
        params do
          requires :phone, type: String
        end
        get '/send_verification_code' do
          send_code = User.send_verification_code(params[:phone])
          if send_code
            present :result, true
          else
            present :result, false
          end
        end
        
        desc '注册'
        params do
          requires :phone, type: String
          requires :password, type: String
          requires :code, type: Integer
        end
        get '/signup' do
          user_code = UserPhoneCode.where(phone: params[:phone]).last
          if user_code && user_code.code == params[:code]
            remember_token = User.new_remember_token
            user = User.new(phone: params[:phone], password: params[:password], remember_token: User.encrypt(remember_token))
            if user.save
              present user, with: V1::Entities::User::Users
            else
              error!('validates errors', 409)
            end
          else
            error!('not validates phone', 404)
          end
        end

        desc '登陆'
        params do
          requires :phone, type: String
          requires :password, type: String
        end
        get '/signin' do
          user = User.find_by(phone: params[:phone])
          if user && user.authenticate(params[:password])
            present user, with: V1::Entities::User::Users
          else
            error!('401 Unauthorized', 401)
          end
        end

      end

    end
  end
end
