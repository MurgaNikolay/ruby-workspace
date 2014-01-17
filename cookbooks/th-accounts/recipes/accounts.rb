#
# Cookbook Name:: general
# Recipe:: manage_groups
#
# Copyright 2013, Murga Nikolay
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

settings = {
    user: {
        lwrp: :user_account,
        attrs: %w{comment uid gid home shell password system_user manage_home create_group
        ssh_keys ssh_keygen}
    },
    group: {
        lwrp: :group,
        attrs: %w{gid group_name append members}
    }
}

%w(group user).each do |resource|
  bag_name = node[resource]['data_bag_name']
  resources_array = node
  node[resource]['array_node_attr'].split('/').each do |hash_key|
    resources_array = resources_array.send(:[], hash_key)
  end

  resources_array.each do |resource_name, actions|
    resource_data = data_bag_item(bag_name, resource_name.gsub(/[.]/, '-'))
    resource_name = resource_name || resource_data['group_name'] || resource_data['id']
    send(settings[resource.to_sym][:lwrp], resource_name) do
      settings[resource.to_sym][:attrs].each do |attr|
        send(attr, resource_data[attr]) if resource_data[attr]
      end
      actions = resource_data['action'] || actions || :create
      if actions
        actions = actions.is_a?(Array) ? actions.map(&:to_sym) : actions.to_sym
        action actions
      end
    end

    if !resource_data['groups'].nil? && resource == 'user'
      resource_data['groups'].each do |groupname|
        group groupname do
          members resource_name
          append true
        end
      end
    end
  end if resources_array
end