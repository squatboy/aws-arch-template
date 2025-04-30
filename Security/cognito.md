## Example #1 - Amazon Cognito + API Gateway
![image](https://github.com/user-attachments/assets/1bf363ec-f25e-4d62-b02c-e98624bd08f7)
```
* Cognito 중심 작동 흐름 요약 *

1.  로그인/회원 가입 시도 👤
2.  앱은Cognito 에 인증 요청 전송 
3.  Cognito 는 사용자 자격 증명 확인 (ID/PW, 소셜 로그인 등) ✅
4.  인증 성공 시, Cognito 는 앱에 인증 토큰 발급 ➡️ 앱
5.  앱 → API Gateway: 토큰 포함 API 요청 전송
6.  API Gateway → Cognito: 토큰 유효성/권한 검증
7.  API Gateway → Lambda: 검증 성공 시 요청 전달
8.  Lambda: 요청 처리 후 결과 반환
9.  API Gateway → 앱: 결과 응답

- Cognito -> 사용자의 **인증**을 담당
- 발급된 토큰을 통해 API Gateway에서 사용자의 **권한**을 확인하여
백엔드 리소스 접근을 제어하는 중심 역할을 수행
```
![image](https://github.com/user-attachments/assets/dd0be12d-91be-4424-8661-39589695a72d)
