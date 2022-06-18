docker-compose -f docker-compose-build.yaml build --parallel
docker-compose up
# build docker hub
# udagram-frontend
docker build -t udagram-frontend ./udagram-frontend
docker tag udagram-frontend hang050697/udagram-frontend:v13
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/udagram-frontend:v13


#udagram-api-user
docker build -t udagram-api-user ./udagram-api-user
docker tag udagram-api-user hang050697/udagram-api-user:v9
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/udagram-api-user:v9


#udagram-api-feed
docker build -t udagram-api-feed ./udagram-api-feed
docker tag udagram-api-feed hang050697/udagram-api-feed:v9
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/udagram-api-feed:v9

#reverseproxy
docker build -t udagram-reverseproxy ./udagram-reverseproxy
docker tag udagram-reverseproxy hang050697/reverseproxy:v9
echo "Hang0762512699" | docker login -u "hang050697" --password-stdin
docker push hang050697/reverseproxy:v9
#check bug :kubectl describe pod backend-feed-6897c6c74c-2sf7f
# kubectl set image deployment frontend frontend=hang050697/udagram-frontend:v13
 kubectl set image deployment backend-feed backend-feed=hang050697/udagram-api-user:v9
  kubectl set image deployment backend-user backend-user-user=hang050697/udagram-api-user:v9
kubectl get service
kubectl get pods