function Connect-EWSService {
    [OutputType('Microsoft.Exchange.WebServices.Data.ExchangeService')]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [String]$Mailbox,

        [String]$ServiceUrl,

        [Microsoft.Exchange.WebServices.Data.ExchangeVersion]
        $Version = [Microsoft.Exchange.WebServices.Data.ExchangeVersion]::Exchange2013_SP1,
        
        [switch]$AllowRedirect,
        
        [Management.Automation.PSCredential]
        [Management.Automation.Credential()]
        $Credential = [Management.Automation.PSCredential]::Empty,

        [String]$OauthToken
    )

    $exchangeService = New-Object -TypeName Microsoft.Exchange.WebServices.Data.ExchangeService -ArgumentList $Version

    if ($Credential -ne [Management.Automation.PSCredential]::Empty) {
        $exchangeService.UseDefaultCredentials = $false
        $exchangeService.Credentials = $Credential.GetNetworkCredential()   
    } elseif ($OauthToken) {
        $ID = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::New()
        $ID.Id = $Mailbox
        $exchangeService.ImpersonatedUserId = $ID
        $exchangeService.Credentials = [Microsoft.Exchange.WebServices.Data.OAuthCredentials]$OauthToken
    } else {
        $exchangeService.UseDefaultCredentials = $true
    }

    if ($ServiceUrl) {
        $exchangeService.Url = $ServiceUrl
    } else {
        try {
            $exchangeService.AutodiscoverUrl($Mailbox,{[bool]$AllowRedirect})
        } catch {
            Write-Error -Message "Failed to identify Url for $Mailbox - $_"
            return
        }
    }

    $Script:exchangeService = $exchangeService
    $Script:connections.Add(
        $exchangeService,
        $Mailbox
    )
    $exchangeService
}
