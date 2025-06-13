# propagate-merger-test

Test repository for [propagate-merger](https://github.com/egoavara/propagate-merger) GitHub Action functionality.

## 🚀 Workflows

### 1. **Create Hotfix Branch**
- **Purpose**: Create hotfix branches from version tags
- **Trigger**: Manual (workflow_dispatch)
- **Usage**: Create `hotfix/v0.1.0-hotfix.1` from `v0.1.0` tag

### 2. **Auto Propagate Hotfix on PR Merge** 🎯
- **Purpose**: Automatically propagate hotfix to other branches when hotfix PR is merged to main
- **Trigger**: Automatic (when hotfix PR → main is merged)
- **Process**:
  1. Detects hotfix branch pattern (e.g., `hotfix/v0.1.0-hotfix.1`)
  2. Automatically runs `propagate-merger` auto-merge mode
  3. Propagates to semantic version higher branches (dev, release/*)
  4. Comments results on the merged PR

### 3. **Manual Auto Merge Hotfix (Test)**
- **Purpose**: Manual testing of auto-merge functionality
- **Trigger**: Manual (workflow_dispatch)

### 4. **Test GitHub API Access**
- **Purpose**: Verify GitHub API permissions and token functionality
- **Trigger**: Manual (workflow_dispatch)

### 5. **Debug Propagate Merger**
- **Purpose**: Debug and compare manual API vs propagate-merger action
- **Trigger**: Manual (workflow_dispatch)

## 🧪 Test Scenario

1. **Create hotfix branch**: Run "Create Hotfix Branch" workflow
2. **Make hotfix changes**: Checkout the created branch, make changes, commit
3. **Create PR**: Create PR from hotfix branch to main
4. **Merge PR**: Merge the PR → **Auto-propagation will trigger automatically**
5. **Verify**: Check that hotfix was propagated to other branches

## 📊 Repository Structure

```
main ← release/v0.1.1 ← release/v0.1.0
└── dev (ongoing development)
```

When hotfix is merged to main, it automatically propagates to:
- `dev` branch (ongoing development)
- `release/*` branches with higher semantic versions