$DRONE_GITHUB_CLIENT_ID = "f52c9d77756575984f91"
$DRONE_GITHUB_CLIENT_SECRET="41bab8f43936c93f93dfc9a5dfa07c779d746607"
$DRONE_SERVER_HOST="http://drone-ci-cd-drone-ci-cd.7e14.starter-us-west-2.openshiftapps.com/"
$DRONE_SERVER_PROTO="http"

docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --volume=/var/lib/drone:/data \
  --env=DRONE_GITHUB_SERVER=https://github.com \
  --env=DRONE_GITHUB_CLIENT_ID={% $DRONE_GITHUB_CLIENT_ID %} \
  --env=DRONE_GITHUB_CLIENT_SECRET={% $DRONE_GITHUB_CLIENT_SECRET %} \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_SERVER_HOST={% $DRONE_SERVER_HOST %} \
  --env=DRONE_SERVER_PROTO={% $DRONE_SERVER_PROTO %} \
  --env=DRONE_TLS_AUTOCERT=true \
  --publish=80:80 \
  --publish=443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone:1.0.0-rc.1
