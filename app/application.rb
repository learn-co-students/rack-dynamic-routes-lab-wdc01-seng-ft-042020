
class Application
    #@@items = []
def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
        product = req.path.gsub('/items/','')
        qwert = @@items.find {|x| x.name == product}
        binding.pry
        if qwert.nil?
            resp.write "Item not found"
            resp.status = 400
        else
            resp.write "#{qwert.price}"
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end



    resp.finish
end
end
