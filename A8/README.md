# ACTIVIDAD 8

## Instalacion de minikube
1. Instalacion de minikube:

    ```bash
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    ```

2. Instalar kubectl:

    ```bash
    curl -LO "https://dl.k8s.io/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin/
    ```
3. Iniciar Minikube:

    ```bash
    minikube start
    ```

## Despliegue del servidor en Nginx

1. Verificamos que kubernetes este corriendo:

    ```bash
    kubectl get nodes
    ```

2. Creamos el archivo .yaml

    ```yaml
    apiversion: apps/v1
    kind: Deployment
    metadata:  
        name: nginx-deployment
    spec:  
        replicas: 1 
        selector:    
            matchLabels:      
                app: nginx  
        template:    
            metadata:      
            labels:        
                app: nginx    
        spec:      
            containers:      
            - name: nginx        
                image: nginx:latest        
                ports:        
                - containerPort: 80
    ```
3. Desplegamos Nginx

    ```bash
    kubectl apply -f nginx-deployment.yaml
    ```

4. Exposicion del servicio Nginx

    ```bash
    kubectl expose deployment nginx-deployment --type=NodePort --port=80
    ```

5. Obtencion del puerto asignado

    ```bash
    kubectl get service nginx-deployment
    ```

6. Verificaion con el navegador 

    Abrimos el navegador con la siguiente direccion: http://localhost: seguido del puerto que obtuvimos en el paso anterior


## En un ambiente local de Kubernetes existen los nodos masters y workers, como es que esto funciona?

    El nodo master es responsable de gestionar el clúster, coordinando las operaciones, programando los pods y supervisando el estado del sistema. los nodos worker son donde realmente se ejecutan los pods y las aplicaciones. Sin embargo, en un entorno local, a menudo solo hay un nodo, que puede actuar como tanto master como worker, manejando todas las funciones necesarias para el despliegue y la operación de las aplicaciones.