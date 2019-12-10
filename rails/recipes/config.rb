# Run an update on the box.
execute "setup unicorn" do
    command "sudo /srv/www/engagement_service/shared/scripts/unicorn start"
end 