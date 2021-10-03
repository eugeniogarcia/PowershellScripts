pip3 freeze | %{$_.split('==')[0]} | %{pip3 install --upgrade $_}


pip3 list --outdated | %{$_.split(' ')[0]} 


pip3 list --outdated | %{$_.split(' ')[0]} | %{pip3 install --upgrade $_}