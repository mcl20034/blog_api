class Api::V1::UsersController < Api::V1::BaseController

  before_action :authenticate!
  
  swagger_path '/api/v1/users/{id}' do
    operation :get do
      key :summary, 'Find User by ID'
      key :description, 'Returns a single user if the user has access'
      key :operationId, 'findUserById'
      key :tags, [
        'user'
      ]
      parameter :token
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of user to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      response 200 do
        key :description, 'user response'
        schema do
          key :'$ref', :User
        end
      end
      response :default do
        key :description, 'unexpected error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end
  def show
    @user = User.find(params[:id])
    authorize @user, :show?

  end

  swagger_path '/api/v1/users/{id}' do
    operation :put do
      key :summary, 'Update User by ID'
      key :description, 'Returns a single user if the user has access'
      key :operationId, 'findUserById'
      key :tags, [
        'user'
      ]
      parameter :token
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'ID of user to fetch'
        key :required, true
        key :type, :integer
        key :format, :int64
      end
      parameter do
        key :name, :name
        key :in, :query
        key :description, 'Name of user to fetch'
        key :required, true
        key :type, :string
      end      
      response 200 do
        key :description, 'user response'
        schema do
          key :'$ref', :User
        end
      end
      response :default do
        key :description, 'unexpected error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end
  def update
    @user = User.find(params[:id])
    #  return api_error(status: 403) if !UserPolicy.new(current_user, @user).update?
    authorize @user, :update?
    @user.update_attributes(update_params)
    render 'show'
  end

 private

 def update_params
   params.permit(:name)
 end
end
