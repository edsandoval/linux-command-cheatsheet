Login-AzureRmAccount

$subscriptionName = "Microsoft Azure Sponsorship"
$rgName = "region-name"

$vmNames=@("vm-01", "vm-02", "vm-03", "vm-04")
foreach ($vmName in $vmNames){
    Select-AzureRmSubscription -SubscriptionName $subscriptionName

    $vm = Get-AzureRmVM -ResourceGroupName $rgName -Name $vmName

    Stop-AzureRmVM -ResourceGroupName $rgName -Name $vmName

    $vm.StorageProfile.OSDisk.DiskSizeGB = 256
    # $vm.StorageProfile[0].OSDisk[0].DiskSizeGB = 512
    Update-AzureRmVM -ResourceGroupName $rgName -VM $vm

    Start-AzureRmVM -ResourceGroupName $rgName -Name $vmName
}
