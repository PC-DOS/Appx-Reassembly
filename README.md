# Appx Reassembly

Reassemble Microsoft Store appxs for deployment purposes on Windows Phone 8.1.

Windows Phone SDK 8.1 is required.

You can refer to [This Tutorial (Chinese)](http://pc-dos.wikidot.com/convert-store-appxs-to-deployable-packages) for detailed information.

## Components

`UnpackAll.bat` unpacks all the Appx files extracted from a AppxBundle. It requires `7z.exe` to work.<br>
`RemoveStoreRelatedFiles.bat` removes Microsoft Store related files. This file must be copied to the output directory of `UnpackAll.bat`<br>
`PackAll.bat` packes all modified files in to separated Appx files.<br>
`CreateAppxBundle.bat` packs all appx files in a specified directory into AppxBundle.

To regenerate AppxBundle, please use:

```
MakeAppx bundle /v /d APPX_INPUT_DIRECTORY /p APPXBUNDLE_OUTPUT_PATH
```

You may have to change the hardcoded path to `MakeAppx.exe` in `PackAll.bat` and `CreateAppxBundle.bat`.

## UWP Signing

Please referto [This Tutorial (Chinese)](http://pc-dos.wikidot.com/convert-store-uwp-to-deployable-packages) for detailed information.

Windows 10 SDK is required for UWP repacking.

UWP packages should be signed to be successfully deployed. You can use PowerShell to create certificate:

```
New-SelfSignedCertificate -Type Custom -Subject "PUBLISHER_SUBJECT_STRING" -KeyUsage DigitalSignature -FriendlyName "CERT_NAME" -CertStoreLocation "Cert:\CurrentUser\My" -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.3", "2.5.29.19={text}")
```

Then, please export the PFX file in PowerShell. You will neet it to sign your package. And you should install the PFX on your target device:

```
$password = ConvertTo-SecureString -String PFX_PASSWORD -Force -AsPlainText 
Export-PfxCertificate -cert "Cert:\CurrentUser\My\CERT_THUMBPRINT" -FilePath PFX_EXPORT_PATH -Password $password
```

Finally, use `SignTool.exe` from Windows 10 SDK to sign your UWP package:

```
SignTool sign /fd SHA256 /a /f PFX_EXPORT_PATH /p PFX_PASSWORD UWP_APPX_PATH
```