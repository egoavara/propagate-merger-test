# Personal Access Token 설정 가이드

## 문제
GitHub Actions의 기본 `GITHUB_TOKEN`으로는 `propagate-merger` 액션이 브랜치를 생성할 때 권한 문제가 발생합니다.

## 해결책: Personal Access Token (PAT) 사용

### 1단계: PAT 생성
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. "Generate new token" 클릭
3. 다음 권한 선택:
   - `repo` (Full control of private repositories)
   - `workflow` (Update GitHub Action workflows)
4. Token 생성 후 복사

### 2단계: Repository Secret 추가
1. 이 레포지토리 → Settings → Secrets and variables → Actions
2. "New repository secret" 클릭
3. Name: `PAT_TOKEN`
4. Secret: 생성한 PAT 붙여넣기
5. "Add secret" 클릭

### 3단계: 워크플로 업데이트
워크플로에서 `github-token: ${{ secrets.GITHUB_TOKEN }}` 를 
`github-token: ${{ secrets.PAT_TOKEN }}` 로 변경합니다.