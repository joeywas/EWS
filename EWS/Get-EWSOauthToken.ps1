Function Get-EWSOAuthToken {
    <#
    .SYNOPSIS
    Gets bearer access token

    .DESCRIPTION
    Uses Office 365 Application ID and Application Secret to generate an authentication token

    .PARAMETER TenantId
    M365 Tenant ID

    .PARAMETER AppId
    Microsoft Azure Application ID.

    .PARAMETER AppSecret
    Microsoft Azure Application secret.

    #>
    Param (
        [parameter(Mandatory = $true)]
        [string]$TenantID,

        [parameter(Mandatory = $true)]
        [string]$AppId,

        [parameter(Mandatory = $true)]
        [string]$AppSecret
    )
    begin {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
        #$TLS12Protocol = [System.Net.SecurityProtocolType] 'Tls12'
        #[System.Net.ServicePointManager]::SecurityProtocol = $TLS12Protocol

        $Uri = "https://login.microsoftonline.com/$($TenantID)/oauth2/v2.0/token"

        $Body = @{
            grant_type = 'client_credentials'
            client_id = $AppId
            client_secret = $AppSecret
            scope = 'https://outlook.office365.com/.default'
        }
    }
    process {
        $OauthResponse = Invoke-RestMethod -Method Post -Uri $Uri -Body $Body
        $OauthResponse.access_token
    }
}
