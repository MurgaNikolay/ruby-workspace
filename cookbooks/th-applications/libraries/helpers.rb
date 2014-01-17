module Opscode
  module ThApplications
    module Helpers
      class << self
        def server_name(node, application)
          [
              application['fqdn'],
              "#{application['application_name']}.#{node['fqdn']}",
              application['aliases'].join(' ')
          ].join(' ').strip
        end
      end
    end
  end
end