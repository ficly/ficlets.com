def tags_path
  '/tags'
end

def tag_path(uri_name)
  "#{tags_path}/#{uri_name}"
end