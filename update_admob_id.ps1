# Fetch AdMob App ID from your API
$response = Invoke-RestMethod -Uri 'https://nooh.live/api/getAppData'
$appID = $response.data[0].appID

# Correct path to the strings.xml file
$stringsXmlPath = "android/app/src/main/res/values/strings.xml"

# XML content with the updated AdMob App ID
$xmlContent = @"
<resources>
    <string name="app_name">YourAppName</string>
    <string name="admob_app_id">$appID</string>
</resources>
"@

# Write to the strings.xml file
Set-Content -Path $stringsXmlPath -Value $xmlContent
