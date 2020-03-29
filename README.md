# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* swagger

bundle exec rails g controller Apidocs index
vi app/controllers/apidocs_controller.rb
vi config/routes.rb # 添加 resources :apidocs, only: [:index]
cd /tmp; git clone https://github.com/swagger-api/swagger-ui.git
cp -R /tmp/swagger-ui/dist ~/workspace/swagger_demo/public/ # 复制 swagger 的静态文件到 rails 项目的 public 目录下.
cd ~/workspace/swagger_demo/public/; mv dist swagger-ui # 重命名 dist 文件夹为 swagger-ui
vi public/swagger-ui/index.html # 替换 http://petstore.swagger.io/v2/swagger.json 为 /apidocs.json


* test curl

curl -X POST -d email="test-user-00@mail.com" -d password="kuban.io" http://localhost:3000/api/v1/sessions

curl --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1ODU0MDEwNTN9.5mpMzosG1ufO0ZSWZkLDjLkh6SO2GJtfXfAlhMZuDEE" http://localhost:3000/api/v1/users/1

curl -X PUT -d name="g-user" --header "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.dapXmST_HVSX2InXfZU8Iz9WnijWfNKN7HsSwjsPsUA" http://localhost:3000/api/v1/users/1