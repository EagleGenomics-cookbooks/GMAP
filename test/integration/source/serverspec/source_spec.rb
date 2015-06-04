require 'serverspec'
require_relative 'spec_helper'

# Required by serverspec
set :backend, :exec

describe command('which gmap') do
  its(:exit_status) { should eq 0 }
end

describe command('gmap --version') do
  its(:stdout) { should match(/Part of GMAP package, version 2013-11-27/) }
end
