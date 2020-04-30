require 'yaml'

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
  not_found = "Sorry, that emoticon was not found"
  master_list.each_pair do |key, values|
    values.each_pair do |k, v|
      if master_list[key][k] == emoticon
        japanese_emoticon = values[:japanese]
      end
    end
  end
  if japanese_emoticon == nil
    return not_found
  else
    return japanese_emoticon
  end
end

def get_english_meaning(file, emoticon)
  master_list = load_library(file)
  english_meaning = nil
  not_found = "Sorry, that emoticon was not found"
  master_list.each_pair do |key, values|
    values.each_pair do |k, v|
      if values[:japanese] == emoticon
        english_meaning = key
      end
    end
  end
  if english_meaning == nil
    not_found
  else
    english_meaning
  end
end
