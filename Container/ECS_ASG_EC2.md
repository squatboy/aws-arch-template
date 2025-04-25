### Auto Scaling EC2 Instances
![image](https://github.com/user-attachments/assets/6a9323d6-51a6-4c63-b947-5537fbb06123)
- ECS Task를 EC2 위에서 실행하는 방식
 ```
ECS 클러스터 (EC2 Launch Type)
│
├── EC2 인스턴스 (ASG로 스케일 업/다운)
│   ├── ECS 에이전트 실행 중
│   └── 여러 ECS Task가 실행됨 (nginx, redis 등)
```

### Exmaple #1 - ECS DIY Auto Scaling - CloudWatch(트리거 역할)
![image](https://github.com/user-attachments/assets/b1ae26a1-86ed-4a0c-b21f-0a2296e748e3)
