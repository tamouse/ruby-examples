0..5.each do |a|
  addr_rec        = OpenStruct.new
  addr_rec.name   = "Cust#{i+1}"
  addr_rec.line1  = "C#{i+1}Line1"
  addr_rec.line2  = "C#{i+1}Line2"
  addr_rec.line3  = "C#{i+1}Line3"
  addr_rec.line4  = "C#{i+1}Line4"
  addr_rec.pcode  = "C#{i+1}PCode"
  addr            <<  addr_rec
end

addr.each do |a|
  `zenity --info --title="My Array" --text="Each Array Element:\n#{a.name}\n#{a.line1}\n#{a.line2}\n#{a.line3}\n#{a.line4}\n#{a.pcode}"`
end
