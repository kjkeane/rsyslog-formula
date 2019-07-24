# Overide by OS
package_name = 'bash'
if os[:name] == 'centos' and os[:release].start_with?('6')
  package_name = 'rsyslog'
end

control 'rsyslog package' do
  title 'should be installed'

  describe package(package_name) do
    it { should be_installed }
  end
end
