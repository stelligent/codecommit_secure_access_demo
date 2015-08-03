require 'spec_helper'

describe package('git') do
  it { should be_installed }
end

{'alice'=>'CCProjectAlphaCommitter.pem','bob'=>'CCProjectAlphaPuller.pem','carol'=>'CCProjectBravoCommitter.pem', 'dave'=>'CCProjectBravoPuller.pem'}.each do |user,pem|
  
  describe user(user) do
    it { should exist }
  end

  describe file("/home/#{user}/.ssh/config") do
    it { should exist }
    it { should be_mode 600}
    it { should contain 'IdentityFile' }
  end

  describe file("/home/#{user}/.ssh/#{pem}") do
    it { should exist }
    it { should be_mode 400 }
  end

  describe file("/home/#{user}/.ssh/known_hosts") do
    it { should contain 'git-codecommit.us-east-1.amazonaws.com' }
  end

end