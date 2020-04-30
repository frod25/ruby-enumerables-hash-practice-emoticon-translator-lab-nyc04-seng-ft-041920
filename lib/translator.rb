require 'pry'
require 'yaml'

library = "emoticons.yml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  binding.pry
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
