# Run an update on the box.
execute "setup unicorn" do
    Chef::Log.info("Install nodejs and start unicorn")
    command "sudo yum install mysql-devel"
    command "sudo yum -y install nodejs"
    command "sudo /srv/www/unicorn_sample/shared/scripts/unicorn start"
end