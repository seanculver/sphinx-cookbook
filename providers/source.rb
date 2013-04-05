action :create do

    conf_path = "#{node[:sphinx][:install_path]}/conf.d/#{new_resource.name}_source.txt"

    template conf_path do
        cookbook "sphinx"
        source "source.erb"
        owner node[:sphinx][:user]
        group node[:sphinx][:group]
        mode 0755
        variables :new_resource => new_resource
    end

end

action :delete do

    conf_path = "#{node[:sphinx][:install_path]}/conf.d/#{new_resource.name}_source.txt"

    execute "Deleting #{new_resource.name}" do
        command "rm #{conf_path}"
    end
end
