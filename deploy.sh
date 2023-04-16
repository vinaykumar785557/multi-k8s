docker build -t vinaykumar785557/multi-client:latest vinaykumar785557/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vinaykumar785557/multi-server:latest vinaykumar785557/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vinaykumar785557/multi-worker:latest vinaykumar785557/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vinaykumar785557/multi-client:latest
docker push vinaykumar785557/multi-server:latest
docker push vinaykumar785557/multi-worker:latest

docker push vinaykumar785557/multi-client:$SHA
docker push vinaykumar785557/multi-server:$SHA
docker push vinaykumar785557/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=vinaykumar785557/multi-client:$SHA 
kubectl set image deployments/server-deployment server=vinaykumar785557/multi-server:$SHA 
kubectl set image deployments/worker-deployment worker=vinaykumar785557/multi-worker:$SHA 