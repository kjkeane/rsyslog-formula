control 'Rsyslog configuration' do
  title 'should match desired lines'

  describe file('/etc/rsyslog.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should include '$WorkDirectory' }
    its('content') { should include '$IncludeDirectory' }
  end
end
