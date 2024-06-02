net.Receive("ttt2_para_death", function()
	EPOP:AddMessage({text =  LANG.TryTranslation("lang_para_death_title"), color = PARANOID.color}, {text = LANG.TryTranslation("lang_para_death_desc")}, 5, nil, true)
end)