data "googleworkspace_group" "group" {
  email = var.group_email
}

data "googleworkspace_group_members" "group_members" {
  group_id = data.googleworkspace_group.group.id
}


resource "googleworkspace_group" "group" {
  email       = var.group_email
  name        = var.group_name
  description = var.group_description
}

resource "googleworkspace_group" "group" {
  email       = var.group_email
  name        = var.group_name
  description = var.group_description
  lifecycle {
    prevent_destroy = true
  }
}

resource "googleworkspace_group_settings" "group_settings" {
  email = googleworkspace_group.group.email
  allow_external_members                         = false
  allow_web_posting                              = true
  archive_only                                   = false
  custom_footer_text                             = ""
  custom_reply_to                                = ""
  custom_roles_enabled_for_settings_to_be_merged = false
  default_message_deny_notification_text         = ""
  enable_collaborative_inbox                     = false
  include_custom_footer                          = false
  include_in_global_address_list                 = false
  is_archived                                    = false
  members_can_post_as_the_group                  = false
  message_moderation_level                       = "MODERATE_NONE"
  primary_language                               = ""
  reply_to                                       = "REPLY_TO_IGNORE"
  send_message_deny_notification                 = false
  spam_moderation_level                          = "SILENTLY_MODERATE"
  who_can_assist_content                         = "NONE"
  who_can_contact_owner                          = "ALL_OWNERS_CAN_CONTACT"
  who_can_discover_group                         = "ALL_MEMBERS_CAN_DISCOVER"
  who_can_join                                   = "INVITED_CAN_JOIN"
  who_can_leave_group                            = "NONE_CAN_LEAVE"
  who_can_moderate_content                       = "OWNERS_ONLY"
  who_can_moderate_members                       = "OWNERS_ONLY"
  who_can_post_message                           = "NONE_CAN_POST"
  who_can_view_group                             = "ALL_OWNERS_CAN_VIEW"
  who_can_view_membership                        = "ALL_OWNERS_CAN_VIEW"
}

resource "googleworkspace_group_member" "member" {
  for_each = var.member_users
  group_id = googleworkspace_group.group.id
  email = each.value
  role  = "MEMBER"
}

resource "googleworkspace_group_member" "manager" {
  for_each = var.manager_users
  group_id = googleworkspace_group.group.id
  email = each.value
  role  = "MANAGER"
}

resource "googleworkspace_group_member" "owner" {
  for_each = var.owner_users
  group_id = googleworkspace_group.group.id
  email = each.value
  role  = "OWNER"
}