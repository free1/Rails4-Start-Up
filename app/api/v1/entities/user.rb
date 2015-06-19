module V1
  module Entities
  	module User
	    class Users < Grape::Entity
	    	root 'users', 'user'
	      expose :id, :phone, :remember_token
	    end
	  end
  end
end
