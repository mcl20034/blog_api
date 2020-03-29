class Api::V1::SessionsController < Api::V1::BaseController
  
  swagger_path '/api/v1/sessions' do
    operation :post do
      key :summary, 'User signin'
      key :description, 'Returns a single user if the user has access'
      key :tags, [
        'session'
      ]
      parameter do
        key :name, :email
        key :in, :query
        key :description, 'email of user to signin'
        key :required, true
        key :type, :string
        key :format, :email
      end
      parameter do
        key :name, :password
        key :in, :query
        key :description, 'password of user to signin'
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
  def create
    @user = User.find_by(email: create_params[:email])

    if @user && @user.authenticate(create_params[:password])
      self.current_user = @user
      render 'show'
    else
      api_error(messages: I18n.t('errors.signin_failed'), status: 401)
    end
  end

  private

  def create_params
    params.permit(:email, :password)
  end

end
