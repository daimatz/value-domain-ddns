require 'json'
require 'tempfile'

def make_json_file(hash)
  file = Tempfile.new('json')
  file.write(JSON.generate(hash))
  file.close
  file.path
end
