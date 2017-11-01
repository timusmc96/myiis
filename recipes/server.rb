#
# Cookbook:: myiis
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end

service 'w3svc' do
  action [ :enable, :start ]
end
