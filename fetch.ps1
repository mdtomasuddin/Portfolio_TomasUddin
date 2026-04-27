$projects = @(
    @{ Name = "urban-rides"; Url = "https://urban-rides.ca/" },
    @{ Name = "davionmbf"; Url = "https://davionmbf.org/" },
    @{ Name = "focusonfoundation"; Url = "https://focusonfoundation.com/" },
    @{ Name = "hkacupuncture"; Url = "https://hkacupuncturecenter.com/" },
    @{ Name = "kimberleeknox"; Url = "https://kimberleeknox.com/" },
    @{ Name = "natureislife"; Url = "https://natureislife.co.zw/" },
    @{ Name = "tiffons"; Url = "https://tiffons.com/" },
    @{ Name = "maringategroup"; Url = "https://maringategroup.com/" },
    @{ Name = "jneinvestments"; Url = "https://jneinvestments.com/" },
    @{ Name = "dubairealestate"; Url = "http://dubairealestateuk.com/" },
    @{ Name = "morrocar"; Url = "http://morrocar.com/" },
    @{ Name = "brightpath"; Url = "https://brightpathvirtualacademy.com/" },
    @{ Name = "suavelaundry"; Url = "https://www.suavelaundry.co.uk/" },
    @{ Name = "aquamanagement"; Url = "https://aqua-management.com/" },
    @{ Name = "kidsphysiotherapy"; Url = "https://kidsphysiotherapywaterford.ie/" },
    @{ Name = "opalaviation"; Url = "https://opal-aviation.com/" },
    @{ Name = "413signs"; Url = "https://413signs.tubatechweb.com" },
    @{ Name = "dougselectrical"; Url = "https://dougselectrical.com/" }
)

$outputDir = "d:\Kakon_portfolios\images"
if (!(Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

foreach ($proj in $projects) {
    $outFile = Join-Path -Path $outputDir -ChildPath "$($proj.Name).jpg"
    if (!(Test-Path -Path $outFile)) {
        Write-Host "Fetching screenshot for $($proj.Name)..."
        $apiUrl = "https://api.microlink.io/?url=$($proj.Url)&screenshot=true&meta=false&embed=screenshot.url"
        try {
            Invoke-WebRequest -Uri $apiUrl -OutFile $outFile
            Write-Host "Saved $outFile"
        } catch {
            Write-Host "Failed to fetch $($proj.Name): $_"
        }
    } else {
        Write-Host "$($proj.Name) already exists."
    }
}
Write-Host "Done fetching screenshots."
