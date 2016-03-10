
def test_data_files(dir)
  Dir.entries(dir).select{|entry| entry =~ /yml$/}
end

def is_test_data_folder_consistent?(data_folder)
  raise "\n\nTest Data Error: Test Data file for the environment \"#{ENV['ENVIRONMENT']}\" is not found in folder \"#{data_folder}\"\n\n" unless test_data_files(data_folder).include? "#{ENV['ENVIRONMENT']}.yml"
end

def read_test_data_file(environment)
  is_test_data_folder_consistent?($test_data_folder)
  data = YAML.load_file(File.join($test_data_folder, "#{environment}.yml"))
  return data
end

def get_test_data(data_key)
  raise "\n\n Test Data Error: No test data found for key \"data_key\"\n\n" if $test_data[data_key].nil?
  return $test_data[data_key]
end