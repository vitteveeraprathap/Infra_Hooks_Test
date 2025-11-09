# Bicep RG + Storage deployment bundle (hooks + workflows)

## What you get
- Local Git hooks to enforce commit messages for feature branches (.githooks)
- Workflows:
  - rg.deploy.yml (subscription-level RG creation)
  - storage.deploy.yml (resource-group deployment for storage - use for recovery)
  - validate-commit-message.yml (server-side check ensuring commit messages include JIRA token)
  - enforce-jira-branch-naming.yml (server-side PR branch name check)
- Bicep files under infra/: resourceGroup.bicep and storage.bicep
- Parameter files for dev/uat/prod environments

## Quickstart
1. Create a new GitHub repo and push these files to `main` branch.
2. Add `AZURE_CREDENTIALS` secret in repo settings (Service Principal JSON).
3. (Optional) Run scripts/install-hooks.sh locally to enable client-side hooks.
4. Use Actions → rg.deploy.yml to create the RG (pick env). This runs a subscription-level deployment.
5. To recover only storage (if deleted), run Actions → storage.deploy.yml and provide `rgName` and environment.
