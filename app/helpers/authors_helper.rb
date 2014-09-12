def authors_path
  '/authors'
end

def author_path(uri_name)
  "#{authors_path}/#{uri_name}"
end