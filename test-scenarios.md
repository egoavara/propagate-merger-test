# Propagate Merger Test Scenarios

이 문서는 propagate-merger GitHub Action을 테스트하기 위한 시나리오들을 정의합니다.

## 🏗️ 테스트 환경 설정

1. 먼저 테스트 시나리오를 설정합니다:
```bash
./setup-test-scenario.sh
```

이 스크립트는 다음을 생성합니다:
- 여러 버전 태그 (v0.1.0, v0.1.1, v0.2.0)
- 개발 브랜치 (develop)
- 릴리스 브랜치 (release/v0.3.0)
- 테스트용 커밋들

## 🧪 테스트 시나리오

### 시나리오 1: Hotfix 브랜치 생성
**목적**: 특정 버전에서 hotfix 브랜치를 생성하는 기능 테스트

**GitHub Actions 워크플로 실행**:
- Mode: `branch-create`
- Version: `v0.1.1`
- Hotfix suffix: `hotfix.1`

**예상 결과**:
- `v0.1.1-hotfix.1` 브랜치가 생성됨
- 해당 브랜치가 v0.1.1 태그를 기반으로 생성됨

### 시나리오 2: 다른 버전에서 Hotfix 브랜치 생성
**목적**: 다른 버전에서도 정상 동작하는지 확인

**GitHub Actions 워크플로 실행**:
- Mode: `branch-create`
- Version: `v0.2.0`
- Hotfix suffix: `hotfix.2`

**예상 결과**:
- `v0.2.0-hotfix.2` 브랜치가 생성됨

### 시나리오 3: Auto-merge 테스트 (준비)
**목적**: 생성된 hotfix 브랜치를 다른 브랜치들로 자동 병합 테스트

**전제 조건**:
- 시나리오 1 또는 2를 통해 hotfix 브랜치가 생성되어 있어야 함
- hotfix 브랜치에 수정사항이 커밋되어 있어야 함

**GitHub Actions 워크플로 실행**:
- Mode: `auto-merge`
- Version: `v0.1.1` (또는 테스트할 버전)
- Hotfix suffix: `hotfix.1`

**예상 결과**:
- Semantic versioning 규칙에 따라 상위 버전 브랜치들로 병합됨
- 충돌이 있는 경우 적절히 처리됨

## 🔍 검증 포인트

1. **브랜치 생성 검증**:
   - 올바른 이름의 브랜치가 생성되었는가?
   - 올바른 기준점(태그)에서 생성되었는가?

2. **Semantic Versioning 동작 검증**:
   - 하위 버전에서 상위 버전으로만 전파되는가?
   - 버전 비교 로직이 정확한가?

3. **병합 전략 검증**:
   - Direct merge와 update-then-merge가 적절히 선택되는가?
   - 충돌 처리가 올바르게 동작하는가?

4. **출력 값 검증**:
   - hotfix-branch 출력이 정확한가?
   - successful-branches와 failed-branches가 올바르게 보고되는가?

## 🚀 실행 방법

1. GitHub Actions 탭으로 이동
2. "Test Propagate Merger" 워크플로 선택
3. "Run workflow" 클릭
4. 원하는 시나리오의 파라미터 입력
5. 실행 결과 확인

## 📊 결과 분석

각 시나리오 실행 후 다음을 확인하세요:
- 워크플로 로그
- 생성된 브랜치들
- 커밋 히스토리
- 태그 상태