require "spec_helper"

# alias d=docker
# alias dc=docker-compose

#  docker network inspect rubyroda_default

describe "Container" do

  it "hello worlds on all instances" do
    exe "docker-compose kill"
    exe "docker-compose up --build -d"
    sleep 1
    # lines = exe "docker-compose ps"
    # p instances = lines[2..-1]
    #
    # instances = exe "docker-compose ps -q"
    # instances = instances.split "\n"
    # for instance in instances
    #   exe "docker inspect #{instance}"
    # end

    instances = [
      "172.30.0.2",
      "172.30.0.3",
      "172.30.0.4",
    ]

    instances.size.should == 3

    for instance in instances
      as_server "#{instance}:3000"
      resp = get "/", parse: false
      resp.should =~ /hello world/i
    end
  end

end
