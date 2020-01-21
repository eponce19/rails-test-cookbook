# # Recipe used for a setup and deploy events
# Chef::Log.info("Install nodejs")
# # command "sudo yum -y install nodejs"
# # node.default['nodejs']['install_method'] = 'binary'
# # node.default['nodejs']['version'] = '5.10.0'
# # node.default['nodejs']['binary']['checksum']['linux_x64'] = '...'
# # include_recipe 'nodejs'
# node['nodejs']['install_method'] = 'package' # Not necessary because it's the default
# include_recipe "nodejs"

Chef::Log.info("Create config/application.yml file...")

node[:deploy].each do |application, deploy|
  environment_variables = deploy[:custom_env].to_h.merge(deploy[:environment_variables].to_h)

  custom_env_template do
    application application
    deploy deploy
    env environment_variables
  end

end