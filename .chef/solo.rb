
work_dir = Dir.pwd
cookbook_path [ "#{work_dir}/cookbooks", "#{work_dir}/vendor" ]
role_path "#{work_dir}/roles"
