local L = LANG.GetLanguageTableReference("en")

-- GENERAL ROLE LANGUAGE STRINGS
L[PARANOID.name] = "Paranoid"
L["info_popup_" .. PARANOID.name] = [[You are the Paranoid! Your Dead Man's Switch will alert others of your death.]]
L["body_found_" .. PARANOID.abbr] = "They were a Paranoid."
L["search_role_" .. PARANOID.abbr] = "This person was a Paranoid!"
L["target_" .. PARANOID.name] = "Paranoid"
L["ttt2_desc_" .. PARANOID.name] = [[The Paranoid can make risky innocent plays because everyone will know when he dies.]]

-- CUSTOM ROLE LANGUAGE STRINGS
L["lang_para_body_text"] = "The corpse of the Paranoid."
L["lang_para_death_title"] = "The Paranoid's heartbeat has stopped!"
L["lang_para_death_desc"] = "This message has been automatically broadcasted due to his Dead Man's Switch."

-- PERK LANGUAGE STRINGS
L["lang_para_dms_name"] = "Dead Man's Switch"
L["lang_para_dms_desc"] = "Upon your death, everyone will be notified."