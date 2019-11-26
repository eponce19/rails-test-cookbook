# Run an update on the box.
execute "sudo yum install mysql-devel" do
    command "sudo yum install mysql-devel"
    command "echo 1234 "
end