Import-Module posh-git
Import-Module PSReadLine
Import-Module oh-my-posh

Set-Theme agnoster


$dockerHome = "C:\Program Files\Docker Toolbox"
$jenHome = "C:\Users\chatojor\Projects\Go\src\tools.adidas-group.com\bitbucket\jen\jenkins-tools"
$projectHome = "C:\Users\chatojor\Projects"


New-Alias dm "$dockerHome\docker-machine.exe"
New-Alias d "$dockerHome\docker.exe"
New-Alias grep "Select-String"
New-Alias l "Get-ChildItem"
New-Alias time "Get-Date"


function home{
	Push-Location $projectHome
}

function jen {
	Push-Location $jenHome
}

function ds {
	docker-machine.exe start
}

function sudo {
	$allArgs = $PsBoundParameters.Values + $args

	if ($allArgs) {
		powershell.exe -c "$allArgs" -new_console:ac
	} else {
		powershell.exe -new_console:a
	}
}

function v ($openVim = ".") {
	gvim $openVim
}
