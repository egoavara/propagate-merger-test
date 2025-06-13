#!/bin/bash

# Test scenario setup script for propagate-merger
echo "🚀 Setting up test scenario for propagate-merger..."

# Set git config
git config user.name "Test Bot"
git config user.email "test@example.com"

echo "📋 Initial repository state:"
git status

# Create multiple version tags to simulate a real project
echo "🏷️  Creating version tags..."
git add .
git commit -m "Initial project setup"

# Create v0.1.0
git tag v0.1.0
echo "Created tag v0.1.0"

# Create some development commits
echo "📝 Creating development commits..."
echo "console.log('Development feature 1');" >> src/index.js
git add .
git commit -m "Add development feature 1"

echo "console.log('Development feature 2');" >> src/index.js
git add .
git commit -m "Add development feature 2"

# Create v0.1.1
git tag v0.1.1
echo "Created tag v0.1.1"

# Create more commits
echo "console.log('Development feature 3');" >> src/index.js
git add .
git commit -m "Add development feature 3"

# Create v0.2.0
git tag v0.2.0
echo "Created tag v0.2.0"

# Create development branch
git checkout -b develop
echo "console.log('Develop branch feature');" >> src/index.js
git add .
git commit -m "Add develop branch feature"

# Create release branch
git checkout main
git checkout -b release/v0.3.0
echo "console.log('Release branch feature');" >> src/index.js
git add .
git commit -m "Add release branch feature"

# Back to main
git checkout main

echo "✅ Test scenario setup complete!"
echo "📊 Repository state:"
echo "Branches:"
git branch -a
echo "Tags:"
git tag --list
echo "Current branch: $(git branch --show-current)"

echo ""
echo "🎯 Ready for propagate-merger testing!"
echo "You can now test the following scenarios:"
echo "1. Create hotfix branch from v0.1.0: mode=branch-create, version=v0.1.0"
echo "2. Create hotfix branch from v0.1.1: mode=branch-create, version=v0.1.1"
echo "3. Auto-merge hotfix: mode=auto-merge, version=v0.1.0"
echo ""
echo "Example GitHub Actions workflow dispatch:"
echo "- Mode: branch-create"
echo "- Version: v0.1.1"
echo "- Hotfix suffix: hotfix.1"