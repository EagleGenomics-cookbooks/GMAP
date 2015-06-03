require 'serverspec'

# Required by serverspec
set :backend, :exec

describe command('which gmap') do
  set :path, '/usr/local/bin:/usr/local/sbin:$PATH'
  its(:exit_status) { should eq 0 }
end
