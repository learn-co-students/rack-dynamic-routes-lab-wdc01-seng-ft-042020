
class Application 
  @@items = [Item.new("Bananas", 1.50)] 
  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
      if req.path.match (/items/)
          item_name = req.path.split("/items/").last
          if item = @@items.find {|item| item.name == item_name}
              resp.write item.price
          else
              resp.status = 400
              resp.write "Item not found"
          end
      elsif
          resp.status = 404
          resp.write "Route not found"
      end
      resp.finish
  end
end






class Application
 
    @@songs = [Song.new("Sorry", "Justin Bieber"),
              Song.new("Hello","Adele")]
   
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/songs/)
   
        song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
        song = @@songs.find{|s| s.title == song_title}
   
        resp.write song.artist
      end
   
      resp.finish
    end
  end

  Status Code Chart
Status Number	Code/Description
1	1xx: Informational (request received and continuing process)
2	2xx: Success (request successfully received, understood, and accepted)
3	3xx: Redirection (further action must be taken to complete request)
4	4xx: Client Error (request contains bad syntax and can't be completed)
5	5xx: Server Error (server couldn't complete request)

class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path=="/songs"
        resp.write "You requested the songs"
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end