#!/usr/bin/ruby
# It converts a formal string in an informal one adding some slangs to it

def addSlangs str
  slangs = [", yeah!",
            ", this is crazy, I tell ya.",
            ", can U believe this?",
            ", eh?",
            ", aw yea.",
            ", yo.",
            "? No way!",
            ". Awesome!"]

  punctuation = {"." => true, "!" => true, "?" => true}

  flag = 0;
  idx = 0
  n_slangs = slangs.length

  new_str = ""

  (0...(str.length)).each do |i|
    if punctuation.has_key?(str[i]) and flag == 1 then
      flag = 0
      new_str += slangs[idx]
      idx = (idx + 1) % n_slangs
    elsif punctuation.has_key?(str[i]) and flag == 0 then
      flag = 1
      new_str += str[i]
    else
      new_str += str[i]
    end
  end
  return new_str
end

data = File.open(ARGV[0],"r").read
puts addSlangs data
