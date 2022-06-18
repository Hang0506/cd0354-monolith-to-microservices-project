docker-compose -f docker-compose-build.yaml build --parallel
docker-compose up
# build docker hub
# udagram-frontend
docker build -t udagram-frontend ./udagram-frontend
docker tag udagram-frontend hang050697/udagram-frontend:v7
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/udagram-frontend:v7


#udagram-api-user
docker build -t udagram-api-user ./udagram-api-user
docker tag udagram-api-user hang050697/udagram-api-user:v6
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/udagram-api-user:v6


#udagram-api-feed
docker build -t udagram-api-feed ./udagram-api-feed
docker tag udagram-api-feed hang050697/udagram-api-feed:v6
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/udagram-api-feed:v5

#reverseproxy
docker build -t udagram-reverseproxy ./udagram-reverseproxy
docker tag udagram-reverseproxy hang050697/reverseproxy:v6
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/reverseproxy:v6