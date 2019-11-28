# Run an update on the box.
execute "setup unicorn" do
    Chef::Log.info("yum install nodejs")
    command "sudo yum -y install nodejs"
    command "sudo /srv/www/unicorn_sample/shared/scripts/unicorn start"
end