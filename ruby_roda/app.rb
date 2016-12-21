require_relative 'env'

class App < Roda
  route do |r|
    r.root do
      "Hello world!"
    end
  end
end
