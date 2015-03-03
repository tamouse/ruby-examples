def valid_ip?(ip)
  octets = ip.split "."
  return false unless octets.size == 4
  octets.all? {|i| (o = Integer(i) rescue false) && o >= 0 && o <= 255 }
end
