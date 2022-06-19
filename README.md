B1:Create Bucket -> Tạo https://awspolicygen.s3.amazonaws.com/policygen.html  bỏ vào chỗ xét quyền 
{
"Version":"2012-10-17",
"Statement":[
  {
      "Sid":"Stmt1625306057759",
      "Principal":"*",
      "Action":"s3:*",
      "Effect":"Allow",
      "Resource":"arn:aws:s3:::test-nd9990-dev-wc"
  }
]
}
B2 : CORS configuration chỗ quyền của S3 bucket
[
 {
     "AllowedHeaders":[
         "*"
     ],
     "AllowedMethods":[
         "POST",
         "GET",
         "PUT",
         "DELETE",
         "HEAD"
     ],
     "AllowedOrigins":[
         "*"
     ],
     "ExposeHeaders":[

     ]
 }
]
B3: Create PostgreSQL database(RDS)
Tạo db với username :HangNT60  PASS :05061997
thay đổi thì nhớ export lại để cập nhật thông tin

psql -h mypostgres-database-1.c5szli4s4qq9.us-east-1.rds.amazonaws.com -U HangNT60 postgres

Add quyền anywhere cho nó
 
bổ sung vào file package.json
"optionalDependencies": {
    "fsevents": "*"
 },

git clone https://github.com/Hang0506/cd0354-monolith-to-microservices-project.git
cd cd0354-monolith-to-microservices-project
deploy and build push docker hub
docker-compose -f docker-compose-build.yaml build --parallel
docker-compose up
services:
  - docker
create cluster -> tao role ial mgt console chọn ec2 and eks ->bỏ subnet 172.31.48.0-> tạo 
lệnh check trạng thái aws eks --region us-east-1 describe-cluster --name clusterProject3 --query cluster.status
ở cluster -> add node group -> tạo Iam Mgt console ->chỉ chọn ec2 -> tìm eks với CNI_Policy,wokernodePolicy tiếp tục tìm contain containerRegisterReadOnly -> tạo

https://www.youtube.com/watch?v=SsUnPWp5ilc&t=1084s&ab_channel=e2eSolutionArchitect
before_script: pip install docker-compose
update cluster
aws eks --region us-east-1 update-kubeconfig --name clusterProject3 
script:
  - docker build -t udagram-frontend ./udagram-frontend
  # Do similar for other three images
  # Tagging
  - docker tag udagram-frontend hang050697/udagram-frontend:v6
6  # Do similar for other three images
  # Push
  # Assuming DOCKER_PASSWORD and DOCKER_USERNAME are set in the Travis repository settings
  - docker push hang050697/udagram-frontend:v6
  # Do similar for other three images 

  - docker build -t reverseproxy ./udagram-reverseproxy
  # Do similar for other three images
  # Tagging
  - docker tag reverseproxy  hang050697/reverseproxy:v3
  # Do similar for other three images
  # Push
  # Assuming DOCKER_PASSWORD and DOCKER_USERNAME are set in the Travis repository settings
  - docker push hang050697/reverseproxy:v3
  # Do similar for other three images 
Nếu update cluster
aws eks --region us-east-1 update-kubeconfig --name clusterProject3
Tạo tài khoản docker hub sau đó liên kết với trasvis
Nếu bạn đang xây dựng lại hình ảnh, bạn phải xóa cục bộ hình ảnh hiện có bằng cách sử dụng:
# Run from the directory where you have the compose file present
docker-compose down
# To delete all dangling images
docker image prune --all
kubectl set image deployment udagram-frontend udagram-frontend=hang050697/udagram-frontend:v3


# Apply env variables and secrets
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml
# Deployments - Double check the Dockerhub image name and version in the deployment files
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f backend-feed-service.yaml
kubectl apply -f backend-user-deployment.yaml
kubectl apply -f backend-user-service.yaml

kubectl apply -f frontend-deployment.yaml
kubectl apply -f frontend-service.yaml

kubectl apply -f reverse-proxy-deployment.yaml
kubectl apply -f reverse-proxy-service.yaml

kubectl expose deployment udagram-frontend --type=LoadBalancer --name=publicfrontend
nếu muốn xóa deployment 
kubectl delete deployment reverseproxy
kubectl delete deployment udagram-api-feed


xóa services 
kubectl delete pods reverseproxy
kubectl delete --all deployment 

kubectl expose deployment udagram-frontend --type=LoadBalancer --name=publicfrontend
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy  
kubectl describe pod reverseproxy-7f86c6b7f6-pkpjm | grep -A 3 Events

kubectl describe pod reverseproxy-7f86c6b7f6-rvflf | grep -A 9999999999 Events

Travis ->liên kết từ github ->active repo