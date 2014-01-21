require 'serverspec'
require 'pathname'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.os = backend(Serverspec::Commands::Base).check_os
    c.path = '/sbin:/usr/bin'
  end
end

describe port(5127) do
  it { should be_listening }
end

describe "hrforecast daemon" do
  it "has a running service of hrforecast" do
    expect(service("hrforecast")).to be_running
  end
end
