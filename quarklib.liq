
def rewrite_metadata(m) =
  
  title = m["title"]
  artist = m["artist"]
  if title == "" then
   title = "-"
  end
  if artist == "" then
   artist = "unkown"
  end

  conti = get_process_lines("/usr/local/bin/tweet.sh #{quote(title)} #{quote(artist)}")

  [("title","#{title} - www.lagabi.ro")]
end

def get_poetry_intro() = 
  request.create("/home/gabios/media/intropoetry/")
end

def tr(x,old,new)
 sequence([ x , new ])
end

def tr2(old,new)
 log("changing to another source !!! ")
 new
end

def createnext(m)
 conti = get_process_lines("/usr/local/bin/musicnext.sh")
end
