json.session do
  json.(@user, :id, :name, :admin, :email)
  json.token @user.token
end