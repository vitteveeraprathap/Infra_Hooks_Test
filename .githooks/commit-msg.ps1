param($CommitMsgFile)
$branch = git rev-parse --abbrev-ref HEAD 2>$null
if ($branch -match '^feature/se-\d+$') {
    $token = $branch
    $msg = Get-Content -Raw $CommitMsgFile
    if ($msg -notmatch [regex]::Escape($token)) {
        Write-Error "ERROR: Commit message must include the branch JIRA token: $token"
        Write-Error "Example: '$token: short description'"
        exit 1
    }
}
exit 0
