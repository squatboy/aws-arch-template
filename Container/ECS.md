## Basic Concept - running ECS on EC2 instance
![image](https://github.com/user-attachments/assets/6e3b3727-461e-4f1c-9587-fb599bdd3561)

```
EC2 인스턴스를 직접 관리
컨테이너 이미지 준비 -> ECS 클러스터 생성
ECS 에이전트를 설치하여 ECS 클러스터에 등록   
태스크 정의 작성 -> 서비스 생성 및 배포    
(Auto Scaling 설정)
```

## Example #1 - ECS + EC2 Multi AZ + ( ASG + ALB + CloudWatch Logs )
![image](https://github.com/user-attachments/assets/7133850d-1fb8-47aa-8f2c-677b76944245)

```
ALB - 들어오는 트래픽을 정상적인 상태의 ECS 호스트로 분산
ECS 호스트=EC2에서 실행 중인 컨테이너화된 애플리케이션이 요청을 처리
필요한 경우 EC2는 NAT 게이트웨이를 통해 인터넷으로 아웃바운드 통신
ECS 호스트의 수는 자동으로 조정 ASG
컨테이너 로그 - CloudWatch Logs로 전송되어 관리
```

## Example #2 - ECS + AWS Fargate + (RDS)
![image](https://github.com/user-attachments/assets/06affd0a-40ae-45da-ac69-ab687f0e350b)

```
ALB는 들어온 요청 경로(/metadataapi 또는 /policyapi)에 따라 해당 대상 그룹으로 트래픽을 라우팅
각 대상 그룹은 Fargate에서 실행 중인 해당 컨테이너(Metadata Container 또는 Policy Container)로 트래픽을 전달
Fargate에서 실행되는 컨테이너는 필요에 따라 DB 서비스(SQL Server RDS, ElastiCache, DynamoDB)와 상호작용하여 데이터를 처리하고 응답을 생성
애플리케이션 로그 -> CloudWatch로 전송 -> 모니터링 및 문제 해결에 사용
Fargate 태스크가 다른 AWS 서비스에 접근하기 위한 권한은 IAM 역할을 통해 관리
```
