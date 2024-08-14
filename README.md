# Deliverables

## 1. Documentations of your processes

#### Step 1: Prepared the Code Repository
- Created a new [repository](https://github.com/yasinymg/DEVOPS-promotional-task-8.git) on GitHub and pushed application code.
- Added [application](./main.py) code to the repository. 
- Added a [Dockerfile](./Dockerfile) for the application, to containerize it
- Pushed image to Docker image registry using GitHub Actions
```yml
- name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v2

    - name: Log in to DockerHub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKER_USERNAME }}        # provided in the repository secret
        password: ${{ secrets.DOCKER_PASSWORD }}        # provided in the repository secret

    - name: Build and Push Docker Image
      run: |
        docker build -t ${{ secrets.DOCKER_USERNAME }}/myapp:latest .
        docker push ${{ secrets.DOCKER_USERNAME }}/myapp:latest
```



#### Step 2: Set Up GitHub Actions
- In the repository, I created a YAML file deploy.yml inside a .github/workflows directory with the required configurations [here]

#### Step 3: Set Up Terraform for EC2 and Minikube
- Created terraform [modules](./modules/) for your [EC2](./modules/ec2/), [VPC](./modules/vpc/)
- Created [root modules](main.tf)
- Created an EC2 instance with [Minikube](./modules/ec2/scripts/install_minikube.sh) running on it.
- Run the appropriate Terraform commands in your terminal. ![](screenshots/terraform-apply.png)

#### Step 4: Access the Minikube Cluster
- SSH into the created EC2 instance using the public IP output from Terraform. Inside the EC2 instance, I installed docker as the driver, changed my user mode for docker with the command `sudo usermod -aG docker $USER`, configured kubectl to use the Minikube cluster. Then I cloned my git repo into the instance, and applied the k8s manifests and ensured it runs perfectly. 

#### Step 5: Automate Deployment with GitHub Actions
- Update the GitHub Actions [workflow]to deploy to the Minikube cluster on the EC2 instance. Ensure the Minikube instance's IP and SSH keys are securely managed. 
![](screenshots/pods.png.png)




## 2. Application for Deployment
I used Python FastAPI
```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Welcome to myapp"}

@app.get("/about")
def read_about():
    return {"about": "This is myapp."}
```


## 3. Terraform Modules 
- I created EC2 module [here](./modules/ec2/)
- I created VPC module [here](./modules/vpc/)
- I created Root module [here](main.tf)

## 4. Kubernetes Manifests
- [deployment.yaml](./k8S/deployment.yaml) 
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
      - name: myapp
        image: yasinymg/myapp:latest
        imagePullPolicy: Always
        ports:
        - containerPort: 80
        resources:
            requests:
                memory: "128Mi"
                cpu: "250m"
            limits:
                memory: "256Mi"
                cpu: "500m"
```

- [service.yaml](./k8S/service.yaml)
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp
spec:
  type: ClusterIP
  selector:
    app: myapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8000
```





