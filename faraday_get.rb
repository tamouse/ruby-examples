result = @conn.put do |req|
  req.url = '/api/2.0/checks'
  req.params[:checkid] = checkid
  req.params[:name] = name unless name.empty?
  req.params[:host] = host unless host.empty?
  req.params[:paused] = paused unless paused.empty?
  req.params[:resolution] = resolution unless resolution.empty?
  req.params[:contactids] = contactids unless contactids.empty?
  req.params[:sendtoemail] = sendtoemail unless sendtoemail.empty?
  req.params[:url] = url unless url.empty?
  req.params[:encryption] = encryption unless encryption.empty?
end
