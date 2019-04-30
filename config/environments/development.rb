Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  #trueでは開発者用のエラー画面、falseではユーザー用のエラー画面が出現する設定になります
  config.consider_all_requests_local = false
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
　　config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  
  config.action_mailer.default_url_options = { host: 'localhost:3000（cloud9だったら自分のcloud9のホスト名）' }
  
  config.action_mailer.delivery_method = :letter_opener_web
  
  config.action_mailer.default_url_options = { host: 'mailer-ryuseimatsumoto.c9users.io:8080/' }
  
end
