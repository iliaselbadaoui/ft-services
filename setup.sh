if [[ $(minikube status | grep -c "Running") == 0 ]]
then
    minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
    minikube addons enable metrics-server
    minikube addons enable ingress
    minikube addons enable dashboard
else
    kubectl delete pods --all
    kubectl delete deployments --all
    kubectl delete svc --all
    kubectl delete pvc --all
fi
eval $(minikube docker-env)
docker build -t nginx srcs/nginx/
docker build -t mysql srcs/mysql/
docker build -t phpmyadmin srcs/phpmyadmin/
docker build -t wordpress srcs/wordpress/
docker build -t ftps srcs/ftps/
docker build -t grafana srcs/grafana/
docker build -t influxdb srcs/influxdb/
kubectl apply -f srcs/mysql_pod.yml
kubectl apply -f srcs/nginx_pod.yml
kubectl apply -f srcs/phpmyadmin_pod.yml
kubectl apply -f srcs/wordpress_pod.yml
kubectl apply -f srcs/ftps_pod.yml
kubectl apply -f srcs/grafana_pod.yml
kubectl apply -f srcs/influxdb_pod.yml
kubectl delete clusterrolebinding kubernetes-dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc6/aio/deploy/recommended.yaml
kubectl apply -f srcs/cluster_admin.yml
kubectl apply -f srcs/ingress.yml
