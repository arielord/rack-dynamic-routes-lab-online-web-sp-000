class Application
  def call(env)
    @@items = []
    
    resp = Rack::Response.new()
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find {|i| i.name == item_name}
      
      if item
        resp.write "#{item.price}"
        resp.status = 200
      else
        resp.write "Item not found #{item_name}"
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end