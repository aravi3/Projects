# json.array! @parties, :name, :guests

json.array! @parties.each do |party|
  json.name party.name
  json.guests party.guests do |guest|
    json.name guest.name
  end
end
