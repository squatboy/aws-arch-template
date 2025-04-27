## Example #1 - ECS + Pull Image from ECR 
![image](https://github.com/user-attachments/assets/ff06dc12-0d3c-4c08-8cd2-dcef13a34b28)

### Setup
로컬에서 Docker 이미지 생성
```
docker build -t myapp:latest .
```

 이미지를 ECR로 업로드 (Push)
```bash
aws ecr create-repository --repository-name myapp
docker tag myapp:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/myapp:latest
docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/myapp:latest
```

ECR에 있는 이미지를 Pull 사용
( ECS, EKS, Fargate, App Runner )
```yaml
# Examaple #1-1
containerDefinitions:
  - name: myapp
    image: <aws_account_id>.dkr.ecr.<region>.amazonaws.com/myapp:latest
    memory: 512
    cpu: 256

```
