class ApplicationController < ActionController::API
  include Concerns::PaginationHeader
  include Pundit

  attr_accessor :current_user

  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  def deny_access
    api_error(messages: "no permissions", status: 403)
  end

  # disable the CSRF token
  # protect_from_forgery with: :null_session

  # disable cookies (no set-cookies header in response)
  before_action :destroy_session

  # disable the CSRF token
  # skip_before_action :verify_authenticity_token

  def destroy_session
    request.session_options[:skip] = true
  end

  def api_error(opts = {})
    render json: {:error=>opts[:messages]}, status: opts[:status]
  end

  protected

  def authenticate!
    render_failed and return unless token?
    @current_user = User.find_by(id: auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render_failed
  rescue JWT::ExpiredSignature
    render_failed ['授权已过期']
  end

  private

  def render_failed(messages = ['验证失败'])
    # render json: { errors: messages}, status: :unauthorized
    api_error(messages: messages, status: 401)
  end

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

  def auth_token
    @auth_token ||= Token.decode(http_token)
  end

  def token?
    http_token && auth_token && auth_token[:user_id].to_i
  end

  # config.middleware.use Rack::RedisThrottle::Daily, max: 3
end
