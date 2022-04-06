# Appx Reassembly

Reassemble Microsoft Store appxs for deployment purposes on Windows Phone 8.1.

Windows Phone SDK 8.1 is required.

You can refer to [This Tutorial (Chinese)](http://pc-dos.wikidot.com/convert-store-appxs-to-deployable-packages) for detailed information.

## Components

`UnpackAll.bat` unpacks all the Appx files extracted from a AppxBundle. It requires `7z.exe` to work.<br>
`RemoveStoreRelatedFiles.bat` removes Microsoft Store related files. This file must be copied to the output directory of `UnpackAll.bat`<br>
`PackAll.bat` packes all modified files in to separated Appx files.<br>
`CreateAppxBundle.bat` packs all appx files in a specified directory into AppxBundle.

To regenerate AppxBundle, please use

```
MakeAppx bundle /v /d APPX_INPUT_DIRECTORY /p APPXBUNDLE_OUTPUT_PATH
```

You may have to change the hardcoded path to `MakeAppx.exe` in `PackAll.bat` and `CreateAppxBundle.bat`.