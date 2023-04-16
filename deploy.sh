docker build -t vinaykumar785557/multi-client -f ./client/Dockerfile ./client
docker build -t vinaykumar785557/multi-server -f ./server/Dockerfile ./server
docker build -t vinaykumar785557/multi-worker -f ./worker/Dockerfile ./worker
docker push vinaykumar785557/multi-client
docker push vinaykumar785557/multi-server
docker push vinaykumar785557/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=vinaykumar785557/multi-server