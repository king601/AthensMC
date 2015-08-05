json.array! @users do |users|
  json.uuid users.dashed_uuid
  json.name users.username
end
## Generates a JSON object for each user with their dashed_uuid as a uuid: object
## Also includes their AthensMC username as name: though Minecraft may ignore/replace that
