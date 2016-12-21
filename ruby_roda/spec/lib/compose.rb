module ComposeSpecLib

  SERVERS = {}

  def get(url, parse: true)
    url = "http://#{server_current_host}#{url}"
    resp = HTTParty.get url
    body = resp.body
    parse ? transform_body(body) : body
  end

  def post(url, params={}, parse: true)
    url = "http://#{server_current_host}#{url}"
    resp = HTTParty.post url, params
    body = resp.body
    parse ? transform_body(body) : body
  end

  def as_server(server)
    SERVERS[:current] = server
  end

  private

  def server_current_host
    SERVERS[:current]
  end

  def transform_body(resp)
    resp = begin
      # Oj.load resp
      JSON.parse resp
    # rescue Oj::ParseError => e
    rescue JSON::ParseError => e
      puts "Error parsing json: #{resp[0..40]}..."
      return resp
    end
    symbolize_keys resp
  end


  # generic utils, TODO move outside

  def exe(cmd)
    puts "executing: #{cmd}"
    out = `#{cmd}`
    puts out
    out
  end

  def symbolize_keys(hash)
    Hash[hash.map{ |key, value| [key.to_sym, value] }]
  end

end
