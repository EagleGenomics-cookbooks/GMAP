require 'serverspec'
require_relative 'spec_helper'

# Required by serverspec
set :backend, :exec

describe command('which gmap') do
  its(:exit_status) { should eq 0 }
end
