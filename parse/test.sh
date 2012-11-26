#!/bin/bash

# Use this to generate session tokens
#
# curl -X GET \
#   -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7" \
#   -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
#   -G \
#   --data-urlencode 'username=matt' \
#   --data-urlencode 'password=matt' \
#   https://api.parse.com/1/login
#
# matt: z6t6fzvaewkxrl8rihujk2rdz
# bing: xwst6g93hl3usl3ngbjd6t0c4
# james: 971n93kju4rbdrgr64iv0d21k
# drew: 230fxpg4o88mgnr8m7zkalxrh


curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: 230fxpg4o88mgnr8m7zkalxrh" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &

curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: 971n93kju4rbdrgr64iv0d21k" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &

curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: xwst6g93hl3usl3ngbjd6t0c4" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &

curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: z6t6fzvaewkxrl8rihujk2rdz" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &

  curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: 230fxpg4o88mgnr8m7zkalxrh" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &

curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: 971n93kju4rbdrgr64iv0d21k" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &

curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: xwst6g93hl3usl3ngbjd6t0c4" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &

curl -X POST \
  -H "X-Parse-Application-Id: mLSNx78YUNSv2Ty6vOTqJZulm7pfSnAaBa0S8KU7  " \
  -H "X-Parse-REST-API-Key: 3Cwu0Kln5bxJsjpvXHl19weURP0jlmc9WrfPdRxQ" \
  -H "X-Parse-Session-Token: z6t6fzvaewkxrl8rihujk2rdz" \
  -H "Content-Type: application/json" \
  -d '{}' \
  https://api.parse.com/1/functions/joinNewGame &