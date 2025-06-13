# Personal Access Token 설정 가이드

## 문제
GitHub Actions의 기본 `GITHUB_TOKEN`으로는 `propagate-merger` 액션이 `git.createRef` API를 호출할 때 "Resource not accessible by integration" 오류가 발생합니다.

**원인**: `GITHUB_TOKEN`은 제한적인 권한을 가진 GitHub App installation token이며, `git.createRef` 같은 일부 API 호출에 필요한 권한이 부족합니다.

## 해결책: Personal Access Token (PAT) 사용

### 1단계: PAT 생성
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. "Generate new token (classic)" 클릭
3. **필수 권한 선택**:
   - ✅ `repo` (Full control of private repositories)
     - `repo:status`
     - `repo_deployment` 
     - `public_repo`
     - `repo:invite`
     - `security_events`
   - ✅ `workflow` (Update GitHub Action workflows)
4. Expiration 설정 (예: 90 days)
5. "Generate token" 클릭
6. ⚠️ **중요**: Token을 안전한 곳에 복사 (다시 볼 수 없음)

### 2단계: Repository Secret 추가
1. 이 레포지토리 → Settings → Secrets and variables → Actions
2. "New repository secret" 클릭
3. **Name**: `PAT_TOKEN`
4. **Secret**: 1단계에서 생성한 PAT 붙여넣기
5. "Add secret" 클릭

### 3단계: 워크플로 사용
새로운 워크플로 "Create Hotfix Branch (with PAT)"를 사용하세요. 이 워크플로는:
- PAT_TOKEN이 있으면 사용
- 없으면 기본 GITHUB_TOKEN 사용 (권한 경고와 함께)

## 테스트 방법
1. PAT_TOKEN secret 설정 완료 후
2. "Create Hotfix Branch (with PAT)" 워크플로 실행
3. 성공적으로 hotfix 브랜치가 생성되는지 확인

## 보안 주의사항
- PAT는 강력한 권한을 가지므로 안전하게 관리
- 정기적으로 토큰 갱신
- 불필요한 권한은 부여하지 않기