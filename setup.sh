if [[ $(minikube status | grep -c "Running") == 0 ]]
then
    # if [[ $(docker-machine status | grep -c "Stopped") == 1 ]]
    # then
    #     docker-machine start
    #     eval $(docker-machine env default)
    # fi
    minikube start --extra-config=apiserver.service-node-port-range=1-35000
    minikube addons enable metrics-server
    minikube addons enable dashboard
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
else
    kubectl delete pods --all
    kubectl delete deployments --all
    kubectl delete svc --all
    kubectl delete pvc --all
fi
sed -i '' "s/IPS/$(minikube ip)/g" srcs/nginx/nginx.conf
sed -i '' "s/IPS/$(minikube ip)/g" srcs/mysql/wp.sql
sed -i '' "s/IPS/$(minikube ip)/g" srcs/ftps/configure.sh
sed -i '' "s/IPS/$(minikube ip)/g" srcs/metalLB.yml
eval $(minikube docker-env)
docker build -t nginx srcs/nginx/
docker build -t mysql srcs/mysql/
docker build -t phpmyadmin srcs/phpmyadmin/
docker build -t wordpress srcs/wordpress/
docker build -t ftps srcs/ftps/
docker build -t grafana srcs/grafana/
docker build -t influxdb srcs/influxdb/
kubectl apply -f srcs/metalLB.yml
kubectl apply -f srcs/mysql_pod.yml
kubectl apply -f srcs/nginx_pod.yml
kubectl apply -f srcs/phpmyadmin_pod.yml
kubectl apply -f srcs/wordpress_pod.yml
kubectl apply -f srcs/ftps_pod.yml
kubectl apply -f srcs/grafana_pod.yml
kubectl apply -f srcs/influxdb_pod.yml
