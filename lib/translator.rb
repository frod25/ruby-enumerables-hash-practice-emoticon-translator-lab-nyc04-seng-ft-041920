require 'yaml'
require 'pry'

library = "./lib/emoticons.yml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons.each_pair do |key, values|
    emoticons[key] = {:english => values.first, :japanese => values.last}
  end
  binding.pry
  emoticons
end

def get_japanese_emoticon(file, emoticon)
  master_list = load_library(file)
  japanese_emoticon = nil
  master_list.each_pair do |key, values|
    if values.include?(emoticon)
      japanese_emoticon = values.last
    end
  end
  japanese_emoticon
end

def get_english_meaning(file, emoticon)
  master_list = load_library(file)
  english_meaning = nil
  master_list.each_pair do |key, values|
    if values.include?(emoticon)
      english_meaning = key
    end
  end
  english_meaning
end

load_library(library)
