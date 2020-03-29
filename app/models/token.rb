class Token
  def self.encode(payload)
    payload.merge!(exp: (Time.now.to_i + 3600)) # 添加过期时间为一小时
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.secrets.secret_key_base)[0])
  rescue
    nil
  end

end