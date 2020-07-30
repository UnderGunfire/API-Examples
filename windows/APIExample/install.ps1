$ThirdPartysrc = 'https://gitee.com/plutoless/API-Examples/attach_files/445294/download'
$ThirdPartydes = 'ThirdParty.zip'
$agora_sdk = 'https://download.agora.io/sdk/release/Agora_Native_SDK_for_Windows_v3_0_1_1_FULL.zip'
$agora_des = 'Agora_Native_SDK_for_Windows_v3_0_1_1_FULL.zip'



if (-not (Test-Path $ThirdPartydes)){
	echo "download $LocalFileName"
	mkdir ThirdParty
	Invoke-WebRequest -uri $ThirdPartysrc -OutFile $ThirdPartydes -TimeoutSec 10;
	Unblock-File $ThirdPartydes
	tar -zxvf $ThirdPartydes -C ThirdParty
	rm $ThirdPartydes
}


if (-not (Test-Path $agora_des)){
	echo "download $LocalFileName"
	Invoke-WebRequest -uri $agora_sdk -OutFile $agora_des -TimeoutSec 10;
	Unblock-File $agora_des
	tar -zxvf $agora_des -C .
	Move-Item Agora_Native_SDK_for_Windows_FULL\libs libs
	rm $agora_des
}



