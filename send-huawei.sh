#!/bin/bash

APPID=1111111111
SECRET=7a9fe5023cb966a180b6

TOKEN=`curl -s -X POST -H "Content-Type: application/x-www-form-urlencoded;charset=utf-8"  "https://oauth-login.cloud.huawei.com/oauth2/v2/token" -d "grant_type=client_credentials&client_secret=$SECRET&client_id=$APPID" | json access_token`

echo "token: $TOKEN"


curl -X POST -H 'Content-type: application/json' -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json;charset=utf-8" "https://push-api.cloud.huawei.com/v1/$APPID/messages:send" -d '{
  "message": {
    "android": {
      "notification": {
        "click_action": {
          "type": 2,
          "url": "https://www.huawei.com"
        }
      }
    },
    "notification": {
      "body": "sample message body",
      "title": "sample title"
    },
    "token": [
      "ADq79u3RRyHYF5hzqZxP-GYBGY4zXBJUmqub5wVKsyxNKMinxowiWMKsZBiscjxVrQnKZU3WusRIzpxLqtN32K-Q_TMHxUFjzXJO0na_cxO6VlJEmjTRSG1oYDcX7cdDBA"
    ]
  }
}'

