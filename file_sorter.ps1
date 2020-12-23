# Small script that sort files from a photo backup server and sort based on date and from which program they came from
# Photo from camera in format

# IMG-20201218-WA0000.jpg              --> from WhatsApp  (small pictures)
# IMG-20201218-WA0000.jpeg             --> from WhatsApp (big pictures)
# VID-20201218-WA0000.mp4              --> from WhatsApp (videos)
# 20201218_233856.jpg                  --> from camera (photo)
# 20201218_233856.mp4                  --> from camera (video)
# Screenshot_20201218-134418_XXXXX.jpg --> Screenshot from an application (XXXXX = Chrome ; Facebook ; Linkedin ; Firefox)

# The program can sort only with more than two files.

# -gt great than

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$documents = "Z:\Samsung SM-G930F Camera Backup"
$dest_dir = "Z:\BACKUP"
#$documents = "Z:\Test\From"
#$dest_dir = "Z:\Test\To"
$filetype = "*.jpg"
$file = Get-ChildItem -Path $documents -Filter $filetype | Where-Object {$_.BaseName.Length -ge 15}

#Get-ChildItem |  Where-Object {$_.Name.Length -gt _ -and $_.LastWriteTime -lt $del_date}

$rej_names= $file.BaseName #without extension
$rej_file=$file.Name #with extension
$rej_dir=$file.FullName #with full path

$directory_camera_date = $rej_names.Substring(0,8)
$directory_whatsa_date = $rej_names.Substring(4,8)


$regex_camera = [regex]"(\d{1,8}[_]{1}\d{1,6})"
$regex_whatsapp = [regex]"(\D\D\D[-]\d{1,8}[-]\D\D\d{1,4})"

for($i =0; $i -lt $file.Count; $i++) # For each of files in $file 
    {
    if($rej_names[$i] -match $regex_camera) #if the file came from camera format
        {
        $new_path = Join-Path -Path $dest_dir -ChildPath (Join-Path -Path "Photos\Camera" -ChildPath $directory_camera_date[$i]) #Prepares the path based on format date (YYYYMMDD)

            if(!(Test-path -Path $new_path -PathType Container)) #if the directory doesn't exist create a new directory based on new path value and copy into the new directory
                {
                New-Item -ItemType Directory -path $new_path
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
            else  # else you say the directory already exists and copy the file into the existing directory
                {
                Write-Host "$($directory_camera_date[$i]) directory exists."
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
        
        Write-Host "$($rej_names[$i]) Camera file copied" #confirm to host that you have copied the file
        }

    elseif($rej_names[$i] -match $regex_whatsapp) #if the file came from whatsapp format
        {
        $new_path = Join-Path -Path $dest_dir -ChildPath (Join-Path -Path "Photos\WhatsApp" -ChildPath $directory_whatsa_date[$i]) #Prepares the path based on format date (YYYYMMDD)

            if(!(Test-path -Path $new_path -PathType Container)) #if the directory doesn't exist create a new directory based on new path value and copy into the new directory
                {
                New-Item -ItemType Directory -path $new_path
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
            else  # else you say the directory already exists and copy the file into the existing directory
                {
                Write-Host "$($directory_whatsa_date[$i]) directory exists."
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
        
        Write-Host "$($rej_names[$i]) WhatsApp file copied" #confirm to host that you have copied the file
        }

    else
        {
        Write-Host "$($rej_names[$i]) Not a file with camera format."
        }
        
    }




    #---------------------------------------- For the videos we use the same script ---------------------------------------

$filetype = "*.mp4"
$file = Get-ChildItem -Path $documents -Filter $filetype 

$rej_names= $file.BaseName #without extension
$rej_file=$file.Name #with extension
$rej_dir=$file.FullName #with full path

$directory_camera_date = $rej_names.Substring(0,8)
$directory_whatsa_date = $rej_names.Substring(4,8)

$regex_camera = [regex]"(\d{1,8}[_]{1}\d{1,6})"
$regex_whatsapp = [regex]"(\D\D\D[-]\d{1,8}[-]\D\D\d{1,4})"


for($i =0; $i -lt $file.Count; $i++) # For each of files in $file 
    {
    if($rej_names[$i] -match $regex_camera) #if the file came from camera format
        {
        $new_path = Join-Path -Path $dest_dir -ChildPath (Join-Path -Path "Videos\Camera" -ChildPath $directory_camera_date[$i]) #Prepares the path based on format date (YYYYMMDD)

            if(!(Test-path -Path $new_path -PathType Container)) #if the directory doesn't exist create a new directory based on new path value and copy into the new directory
                {
                New-Item -ItemType Directory -path $new_path
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
            else  # else you say the directory already exists and copy the file into the existing directory
                {
                Write-Host "$($directory_camera_date[$i]) directory exists."
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
        
        Write-Host "$($rej_names[$i]) Camera file copied" #confirm to host that you have copied the file
        }

    elseif($rej_names[$i] -match $regex_whatsapp) #if the file came from whatsapp format
        {
        $new_path = Join-Path -Path $dest_dir -ChildPath (Join-Path -Path "Videos\WhatsApp" -ChildPath $directory_whatsa_date[$i]) #Prepares the path based on format date (YYYYMMDD)

            if(!(Test-path -Path $new_path -PathType Container)) #if the directory doesn't exist create a new directory based on new path value and copy into the new directory
                {
                New-Item -ItemType Directory -path $new_path
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
            else  # else you say the directory already exists and copy the file into the existing directory
                {
                Write-Host "$($directory_whatsa_date[$i]) directory exists."
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
        
        Write-Host "$($rej_names[$i]) WhatsApp file copied" #confirm to host that you have copied the file
        }

    else
        {
        Write-Host "$($rej_names[$i]) Not a file with camera format."
        }
        
    }

     #---------------------------------------- For the jpeg we use the same script ---------------------------------------

$filetype = "*.jpeg"
$file = Get-ChildItem -Path $documents -Filter $filetype 

$rej_names= $file.BaseName #without extension
$rej_file=$file.Name #with extension
$rej_dir=$file.FullName #with full path

$directory_camera_date = $rej_names.Substring(0,8)
$directory_whatsa_date = $rej_names.Substring(4,8)

$regex_camera = [regex]"(\d{1,8}[_]{1}\d{1,6})"
$regex_whatsapp = [regex]"(\D\D\D[-]\d{1,8}[-]\D\D\d{1,4})"

for($i =0; $i -lt $file.Count; $i++) # For each of files in $file 
    {
    if($rej_names[$i] -match $regex_whatsapp) #if the file came from whatsapp format
        {
        $new_path = Join-Path -Path $dest_dir -ChildPath (Join-Path -Path "Photos\WhatsAppBIG" -ChildPath $directory_whatsa_date[$i]) #Prepares the path based on format date (YYYYMMDD)

            if(!(Test-path -Path $new_path -PathType Container)) #if the directory doesn't exist create a new directory based on new path value and copy into the new directory
                {
                New-Item -ItemType Directory -path $new_path
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
            else  # else you say the directory already exists and copy the file into the existing directory
                {
                Write-Host "$($directory_whatsa_date[$i]) directory exists."
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
        
        Write-Host "$($rej_names[$i]) WhatsApp BIG file copied" #confirm to host that you have copied the file
        }

    else
        {
        Write-Host "$($rej_names[$i]) Not a file with camera format."
        }
        
    }

   #---------------------------------------- For the Whatsapp we use the same script ---------------------------------------

   #We sort only whatsapp files

$filetype = "*.jpg"
$file = Get-ChildItem -Path $documents -Filter $filetype | Where-Object {$_.BaseName.Length -gt 15}

$rej_names= $file.BaseName #without extension
$rej_file=$file.Name #with extension
$rej_dir=$file.FullName #with full path

$directory_screen_date = $rej_names.Substring(11,8)

$regex_screen = [regex]"(\D{1,10}[_]\d{1,8}[-]\d{1,6}[_]\D*)"

for($i =0; $i -lt $file.Count; $i++) # For each of files in $file 
    {
    if($rej_names[$i] -match $regex_screen) #if the file came from whatsapp format
        {
        $new_path = Join-Path -Path $dest_dir -ChildPath (Join-Path -Path "Photos\Screeshoot" -ChildPath $directory_screen_date[$i]) #Prepares the path based on format date (YYYYMMDD)

            if(!(Test-path -Path $new_path -PathType Container)) #if the directory doesn't exist create a new directory based on new path value and copy into the new directory
                {
                New-Item -ItemType Directory -path $new_path
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
            else  # else you say the directory already exists and copy the file into the existing directory
                {
                Write-Host "$($directory_screen_date[$i]) directory exists."
                $rej_dir[$i] | Copy-Item -Destination $new_path
                }
        
        Write-Host "$($rej_names[$i]) Screenshoot file copied" #confirm to host that you have copied the file
        }

    else
        {
        Write-Host "$($rej_names[$i]) Not a file with screnshoot format."
        }
        
    }
