# Google Workspace Module 

## High Level View of Components:   
### Google Workspace
- A service account with the system role 'Groups Administrator' assigned to it

This account can now perform the following on every group for the organization evilmachine.net
 - Add/Delete groups
 - Add/Delete members from groups
 - Add/Delete/Modify groups settings
 - View Users

### Google Cloud
 - A single google cloud project   
 - A bucket for state   
 - A service account with access to the to add members to a group along with a key
 - APIs admin.googleapis.com and groupssettings.googleapis.com enabled


> export GOOGLEWORKSPACE_CREDENTIALS=$(< /Users/bcerniglia/Documents/GitHub/working/tf-workspace-groups/tf_ws_creds.json) 
