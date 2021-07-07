require "yaml"

def load_library(file)
  emos = YAML.load_file(file)
  final = {}
  gm = {}
  ge = {}
  
  # fill get_meaning key -- PASSED
  emos.each do |keys, v_arrays|
    gm[v_arrays[1]] = keys
  end
  final[:get_meaning] = gm
  
  #fill get_emoticon key -- PASSED
  emos.each do |keys, v_arrays|
    ge[v_arrays[0]] = v_arrays[1]
  end
  final[:get_emoticon] = ge
  final
end

def get_japanese_emoticon(yam, emo)
  emoticon_hash = load_library(yam)
  emoticon_hash[:get_emoticon].each do |k, v|
    if k == emo
      return v
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(yam, emo)
  emoticon_hash = load_library(yam)
  emoticon_hash[:get_meaning].each do |k, v|
    if k == emo
      return v
    end
  end
  return "Sorry, that emoticon was not found"
end

pp load_library("./lib/emoticons.yml")