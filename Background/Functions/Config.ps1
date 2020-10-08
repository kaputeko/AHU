# CONFIGURATION FILE

# --- Directories ---

# HANDJOB folder Where are your handjobs encodes.
# The script seems to work with directories with spaces. But if possible try to avoid.
# "D:\Encodes\My HANDJOBs\" (OK ...)
# "D:\Encodes\My_HANDJOBs\" (Much better)
# Example:
# $folderHandjob = "D:\Encodes\HANDJOB\"

$folderHandjob = ""

# Custom Output Folder
# By default it will save your work in the 'OutputHandjob' folder unless you define a path.
# The script seems to work with directories with spaces. But if possible try to avoid.
# "C:\Users\HJ\Desktop\My Out" (OK ...)
# "C:\Users\HJ\Desktop\My_Out" (Much better)
# Example:
# $customOutputFolder = "C:\Users\HJ\Desktop\Out"

$customOutputFolder = ""

# --- Torrent ---

# Announce URL

$announceURL = ""

# Source of Torret
# An optional source string that wil be added to the info dictionary. 
# Useful for creating torrents with unique info hashes for private trackers.

$sourceTorrent = "PTP"

# --- Image Hosting ---

# Ptpimg API Key
<# (MANDATORY) To find your PTPImg API key, login to https://ptpimg.me, open the page source
(i.e. "View->Developer->View source" menu in Chrome), find the string api_key and copy the hexademical 
string from the value attribute. Your API key should look like 43fe0fee-f935-4084-8a38-3e632b0be68c. #>

$api_key_ptpimg = ""

# Catbox user hash
<# (OPTIONAL) First create a catbox account: https://catbox.moe/user/register.php) 
After logging into your account, go to https://catbox.moe/user/manage.php to get your user hash. #>

$user_hash_catbox = ""

# Choose which image server to use
# ptpimg (Must have a registered account and inform $api_key_ptpimg.)
# catbox (Must have a registered account and inform $user_hash_catbox.)
# pixhost (No need to have a registered account.)

$ImageServer = "pixhost"

# --- Template ---

<# It is possible to create or modify the standard script template.
You should only keep in mind that you need to include three elements that are replaced by the source, mediainfo and image links.
<source> - It is equivalent to the information entered in the second parameter of the command.
<mediainfo> - Receive the mediainfo log.
<ptpimg> - Receive the url of regular images.
<comps> - Receive the URL of the comparison images.
If you choose to create a new template, simply enter your name in the script and place it in the 'Templates' folder. #>

$regular_Template = "elegant_handjob.txt"
$screencomp_Template = "elegant_handjob_comps.txt"

# --- Other settings ---

# Clear contents of the 'Screens Comp' folder after running the script? (yes/no)

$deleteComps = "yes"