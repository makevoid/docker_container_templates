require "spec_helper"

# alias d=docker
# alias dc=docker-compose

#  docker network inspect rubyroda_default

describe "Container" do

  it "hello worlds on all instances" do
    # exe "docker-compose down"
    exe "docker-compose kill"
    exe "docker-compose up --build -d"
    exe "docker-compose scale app=3"

    sleep 0.2
    # probably sleep 1 on a slower laptop - msivoid

    # lines = exe "docker-compose ps"
    # p instances = lines[2..-1]
    #
    # instances = exe "docker-compose ps -q"
    # instances = instances.split "\n"
    # for instance in instances
    #   exe "docker inspect #{instance}"
    # end

    ip2 = 30
    ip2 = 20 if `hostname`.strip == "mkvtop"

    instances = [
      "172.#{ip2}.0.2",
      "172.#{ip2}.0.3",
      "172.#{ip2}.0.4",
    ]

    instances.size.should == 3

    for instance in instances
      as_server "#{instance}:3000"
      resp = get "/", parse: false
      resp.should =~ /hello world/i
    end
  end

end
