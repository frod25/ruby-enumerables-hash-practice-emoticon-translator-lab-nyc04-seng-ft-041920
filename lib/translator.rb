require 'yaml'
#require 'pry'

library = "./lib/emoticons.yml"
test_jap_moji = "☜(⌒▽⌒)☞"
test_eng_moji = "O:)"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons.each_pair do |key, values|
    emoticons[key] = {:english => values.first, :japanese => values.last}
  end
  emoticons
end

def get_japanese_emoticon(file, emoticon)
  master_list = load_library(file)
  japanese_emoticon = nil
  master_list.each_pair do |key, values|
    values.each_pair do |k, v|
      if master_list[key][k] == emoticon
        japanese_emoticon = values[:japanese]
      end
    end
  end
  japanese_emoticon
end

def get_english_meaning(file, emoticon)
  master_list = load_library(file)
  english_meaning = nil
  master_list.each_pair do |key, values|
    values.each_pair do |k, v|
      if values[:japanese] == emoticon
        english_meaning = key
      end
    end
  end
  english_meaning
end

#load_library(library)
#get_japanese_emoticon(library, test_eng_moji)
#get_english_meaning(library, test_jap_moji)
