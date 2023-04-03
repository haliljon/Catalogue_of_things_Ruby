require 'json'

def save_data(data, file_path)
  File.write(file_path, JSON.pretty_generate(data), mode: 'w')
  # converts each object to a hash
end

def load_data(file_path)
  File.open(file_path, 'w') unless File.exist?(file_path)
  data = File.read(file_path)
  if data.empty?
    []
  else
    File.open(file_path, 'r') { |line| JSON.parse(line.read) }
  end
end
