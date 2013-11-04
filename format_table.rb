def get_array()
  # sqlite stuff as you have it
  format_table(result)
end

def format_table(data)
  out = "<table>\n"
  out += data.map do |row|
    format_row(row)
  end.join("\n")
  out += "\n</table>\n"
end

def format_row(row)
  out = "<tr>"
  out += row.map do |cell|
    format_cell(cell)
  end.join
  out += "</tr>"
end

def format_cell(cell)
  "<td>#{cell}</td>"
end
