# Accepts:
#   application (application name)
#   deploy (hash of deploy attributes)
#   env (hash of custom environment settings)

define :custom_env_template do
    application = params[:app]    
    deploy = params[:deploy_data]

    template "#{params[:deploy][:deploy_to]}/shared/config/application.yml" do
      source "application.yml.erb"
      owner params[:deploy][:user]
      group params[:deploy][:group]
      mode "0660"
      variables :env => params[:env]
  
      only_if do
        File.exists?("#{params[:deploy][:deploy_to]}/shared/config")
      end
    end
    template "#{params[:deploy][:deploy_to]}/current/config/application.yml" do
      source "application.yml.erb"
      owner params[:deploy][:user]
      group params[:deploy][:group]
      mode "0660"
      variables :env => params[:env]
  
      only_if do
        File.exists?("#{params[:deploy][:deploy_to]}/current/config")
      end
    end

    template "/etc/logrotate.d/opsworks_app_#{application}" do
      backup false
      source "logrotate.erb"
      cookbook 'deploy'
      owner "root" 
      group "root"
      mode 0644
      variables( :log_dirs => ["#{params[:deploy][:deploy_to]}/shared/log" ] )
    end

end