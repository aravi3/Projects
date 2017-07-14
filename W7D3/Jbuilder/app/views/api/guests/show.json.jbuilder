json.partial! 'api/guests/guest', guest: @guest
@guest.gifts.each do |gift|
  json.gifts do
    json.title gift.title
    json.description gift.description
  end
end
