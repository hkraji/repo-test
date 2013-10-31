require 'digest/md5'

module MD5
  def createsig(body)
    Digest::MD5.hexdigest( sigflat body )
  end

  def sigflat(body)
    if body.class == Hash
      arr = []
      body.each do |key, value|
        arr << "#{sigflat key}=>#{sigflat value}"
      end
      body = arr
    end
    if body.class == Array
      str = ''
      body.map! do |value|
        sigflat value
      end.sort!.each do |value|
        str << value
      end
    end
    if body.class != String
      body = body.to_s << body.class.to_s
    end
    body
  end
end