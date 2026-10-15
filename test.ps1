param([int]$Port = 8090, [int]$Min = 1, [string]$Marker = 'data-item')
try {
    $r = Invoke-WebRequest -Uri "http://localhost:$Port/" -UseBasicParsing -TimeoutSec 15
} catch {
    Write-Host "TEST FAILED: application not reachable on port $Port"
    exit 1
}
if ($r.StatusCode -ne 200) { Write-Host "TEST FAILED: HTTP $($r.StatusCode)"; exit 1 }
$count = ([regex]::Matches($r.Content, $Marker)).Count
Write-Host "Found $count item(s) on the page (minimum required: $Min)"
if ($count -lt $Min) { Write-Host "TEST FAILED: too few items"; exit 1 }
Write-Host "TEST PASSED"
exit 