include_recipe 'seven_zip::default'

bin_path = 'C:\bin'

directory "Create #{bin_path}" do
  path   bin_path
  action :create
end

seven_zip_archive 'Download and extract terraform binary' do
  path     bin_path
  source   'https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_windows_amd64.zip'
  checksum 'b14dbb9b9b100ddcd516ad426f31a23016ce351d7481407bc91bceb342307826'
  action   :extract
end

windows_path "Add #{bin_path} to PATH" do
  path   bin_path
  action :add
end

