![elb_architecture](https://github.com/user-attachments/assets/121e88f5-f33b-4313-9e76-63312c667713)
<br>
- `NLB`— Layer 4 (TLS/TCP/UDP traffic), Static IPs.
- `ALB` — Layer 7 (HTTP/HTTPS traffic), Flexible.

## Example #1 - ALB + NLB
![image](https://github.com/user-attachments/assets/28413305-2f78-4f07-85ac-622978e275f9)

```
NLB
외부의 예측 불가능한 트래픽을 안정적으로 처리하고 기본적인 로드 밸런싱

ALB
내부적으로 HTTP/HTTPS 트래픽의 특성을 분석하여 더 정교한 라우팅과 애플리케이션 수준의 기능을 제공
```
