## Example #1 - CloudFront Functions + Lambda@Edge
![image](https://github.com/user-attachments/assets/7e0ecdd3-e58f-4ca8-8729-ac308fb72d04)
```
1.  👤 **Client** ➡️ ① 🌐 **Amazon CloudFront**
2.  🌐 **Amazon CloudFront** (캐시 미스) ➡️ ② 📦 **Amazon S3**
3.  📦 **Amazon S3** ➡️ ② 🌐 **Amazon CloudFront**
4.  🌐 **Amazon CloudFront** ➡️ ⑦ 👤 **Client**
5.  🌐 **Amazon CloudFront** (Viewer/Origin Request/Response) ➡️ ③/④ 🟣 **Lambda@Edge**
6.  🟣 **Lambda@Edge** ➡️ ③/④ 🌐 **Amazon CloudFront** (요청/응답 수정)
7.  (선택적) 🌐 **Amazon CloudFront** ➡️ ⑥ **AWS Lambda**
8.  (선택적) **AWS Lambda** ➡️ ⑤ 🌐 **Amazon CloudFront** (응답)

* 캐시에 없으면 CloudFront는 S3 (2)에서 콘텐츠를 가져옴
* Lambda@Edge (3, 4)는 요청/응답 흐름 중간에서 코드를 실행하여 동작을 변경 가능
* 선택적으로 CloudFront는 Lambda 함수 (6)를 호출하여 동적 처리를 수행하고, Lambda는 결과를 CloudFront (5)로 반환 가능
```
