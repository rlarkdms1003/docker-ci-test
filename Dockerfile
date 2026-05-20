# 1단계 : 빌드 환경 (패키지 설치 등 무거운 작업)
FROM node:18 AS build-env
WORKDIR /app
COPY main.js .
# 실제 앱이라면 여기서 RUN npm install 등을 하겠죠?

# 2단계 : 실행 환경 (오직 실행에 필요한 파일만 가짐)
FROM gcr.io/distroless/nodejs18-debian11
COPY --from=build-env /app /app
WORKDIR /app
CMD ["main.js"]

