class Application

    @@item = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

    def call(env)

        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)

            item_name = req.path.split("/items/").last
                    
            item_to_return = @@item.find { |i| i.name == item_name }

            if item_to_return
                resp.status = 200
                resp.write "#{item_to_return.price}"
                
            else
                resp.status = 400
                resp.write "Item not found"
                
            end


        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end


end
