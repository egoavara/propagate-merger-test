#!/bin/bash

echo "🔄 Rebuilding propagate-merger test scenario..."

# Set git config
git config user.name "Test Bot"
git config user.email "test@example.com"

# 먼저 필요한 디렉토리와 파일들 생성
echo "📁 Creating necessary files..."
mkdir -p src
cat > src/index.js << 'EOF'
// Test application for propagate-merger
console.log('Hello from propagate-merger test application!');

function calculateSum(a, b) {
  return a + b;
}

function greetUser(name) {
  return \`Hello, \${name}!\`;
}

// Export functions for testing
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    calculateSum,
    greetUser
  };
}

// Run if this is the main file
if (require.main === module) {
  console.log(calculateSum(5, 3));
  console.log(greetUser('World'));
}
EOF

# 1. dev 브랜치를 기본으로 생성
echo "📋 Step 1: Create dev branch as base"
git checkout -b dev
git add .
git commit -m "Initial project setup on dev branch"

# 2. dev 브랜치에 개발 코드 커밋들 생성
echo "💻 Step 2: Add development commits to dev branch"
echo "" >> src/index.js
echo "function developmentFeature1() { return 'dev feature 1'; }" >> src/index.js
git add .
git commit -m "Add development feature 1"

echo "function developmentFeature2() { return 'dev feature 2'; }" >> src/index.js
git add .
git commit -m "Add development feature 2"

# 3. dev 브랜치에서 release/v0.1.0 브랜치 생성
echo "🏷️  Step 3: Create release/v0.1.0 from dev"
git checkout -b release/v0.1.0
echo "// Release v0.1.0 준비" >> src/index.js
git add .
git commit -m "Prepare release v0.1.0"
git tag v0.1.0
echo "Created release/v0.1.0 and tagged v0.1.0"

# 4. dev 브랜치로 돌아가서 추가 커밋 후 release/v0.1.1 생성
echo "🔄 Step 4: Back to dev, add more commits, then create release/v0.1.1"
git checkout dev
echo "function developmentFeature3() { return 'dev feature 3'; }" >> src/index.js
git add .
git commit -m "Add development feature 3"

echo "function developmentFeature4() { return 'dev feature 4'; }" >> src/index.js
git add .
git commit -m "Add development feature 4"

# release/v0.1.1 브랜치 생성
git checkout -b release/v0.1.1
echo "// Release v0.1.1 준비" >> src/index.js
git add .
git commit -m "Prepare release v0.1.1"
git tag v0.1.1
echo "Created release/v0.1.1 and tagged v0.1.1"

# 5. dev에 진행 중인 개발 코드 추가
echo "⚡ Step 5: Add ongoing development to dev branch"
git checkout dev
echo "function ongoingDevelopment1() { return 'ongoing dev 1'; }" >> src/index.js
git add .
git commit -m "Add ongoing development work 1"

echo "function ongoingDevelopment2() { return 'ongoing dev 2'; }" >> src/index.js
git add .
git commit -m "Add ongoing development work 2"

# 6. main 브랜치를 최신 릴리스 기준으로 생성 (기존 main을 덮어쓰기)
echo "🎯 Step 6: Update main branch from latest release"
git checkout release/v0.1.1
git checkout -B main
echo "Updated main branch from release/v0.1.1"

# 최종 상태 출력
echo "✅ Scenario rebuild complete!"
echo ""
echo "📊 Final repository state:"
echo "Branches:"
git branch -a
echo ""
echo "Tags:"
git tag --list
echo ""
echo "Current branch: \$(git branch --show-current)"
echo ""
echo "🎯 Ready for propagate-merger testing!"
echo "Test scenarios:"
echo "1. Create hotfix from v0.1.0 → should propagate to v0.1.1, main, dev"
echo "2. Create hotfix from v0.1.1 → should propagate to main, dev" 
echo ""
echo "Branch hierarchy:"
echo "dev (ongoing development) ← main ← release/v0.1.1 ← release/v0.1.0"