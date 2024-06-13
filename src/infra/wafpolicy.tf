
# #Create WAF policy to attach to App Gateway
# resource "azurerm_web_application_firewall_policy" "wafpolicy" {
#   name                = "${var.prefix}-wafpolicy"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location

#   custom_rules {
#     name      = "AllowSpecificIP"
#     priority  = 1
#     rule_type = "MatchRule"

#     match_conditions {
#       match_variables {
#         variable_name = "RemoteAddr"
#       }

#       operator           = "IPMatch"
#       negation_condition = false
#       match_values       = ["191.96.0.0/16"] // Seattle IP range
#     }

#     action = "Allow"
#   }

#   custom_rules {
#     name      = "BlockAllOtherTraffic"
#     priority  = 2
#     rule_type = "MatchRule"

#     match_conditions {
#       match_variables {
#         variable_name = "RemoteAddr"
#       }

#       operator           = "IPMatch"
#       negation_condition = true
#       match_values       = ["0.0.0.0/0"]
#     }

#     action = "Block"
#   }

#   policy_settings {
#     enabled                     = true
#     mode                        = "Prevention"
#     request_body_check          = true
#     file_upload_limit_in_mb     = 100
#     max_request_body_size_in_kb = 128
#     request_body_inspect_limit_in_kb = 0
#   }

#   managed_rules {
#     managed_rule_set {
#       type    = "OWASP"
#       version = "3.1"
#     }
#   }
# }
