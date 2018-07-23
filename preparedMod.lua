-- Sound Mod for "we are prepared", by Maui
-- Version 1.0
-- Original based on: /wipe Addon by 'Matt' on ui.worldofwar.net

function preparedMod_init()
	-- flood protection initialisation
	floodtime = GetTime()
	preparedtime = GetTime()

	timerduration = 1
	
	-- raid initialisation
	raidCheck = 0
	
	SlashCmdList["prepared"] = prepared_command
	SLASH_prepared1 = "/prepared"

	DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00prepared Mod v1.504|cffffffff loaded! Use /prepared help to show all commands.")
end

function preparedMod_OnEvent(self, event, ...)
	local arg1 = ...
	if ((event == "ADDON_LOADED") and (arg1 == "preparedMod")) then
		preparedMod_init()
	end
	
	-- CHAT EVENTS
	if ((event == "CHAT_MSG_YELL") and (preparedmute == 0) and (string.find( arg1, "*", 1 ) == 1)) then
		actual_time = GetTime()
		if ( string.find( arg1, "* WAAAAAGH!! *") ) then
			if ((preparedtime + 20) < actual_time) then
				SendChatMessage("WAAAAAGH!!", "YELL")
				DoEmote("roar")
				preparedtime = GetTime()
			end
		end
		-- if ( (floodtime + timerduration) < actual_time ) then
			floodtime = GetTime()
			if ( string.find( arg1, "* OMG WIPE!! *") ) then
				timerduration = 30
				PlaySoundFile("Interface\\AddOns\\preparedMod\\wipe.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* The Truth Is Out There.. *") ) then
				timerduration = 20
				PlaySoundFile("Interface\\AddOns\\preparedMod\\x-files.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* BATMAAAAAAAAAAN! *") ) then
				timerduration = 50
				PlaySoundFile("Interface\\AddOns\\preparedMod\\batman.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* GUMMIBEARS! *") ) then
				timerduration = 60
				PlaySoundFile("Interface\\AddOns\\preparedMod\\gummibears.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* TEENAGE MUTANT NINJATURTLES! *") ) then
				timerduration = 70
				PlaySoundFile("Interface\\AddOns\\preparedMod\\ninjaturtles.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* SlickSlack *") ) then
				timerduration = 5
				PlaySoundFile("Interface\\AddOns\\preparedMod\\slickslack.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* FUUUUUUUCK *") ) then
				timerduration = 12
				PlaySoundFile("Interface\\AddOns\\preparedMod\\50dkpminus.ogg", "Master")
				DoEmote("beg")
			elseif ( string.find( arg1, "* STAYIN' ALIVE! *") ) then
				timerduration = 70
				PlaySoundFile("Interface\\AddOns\\preparedMod\\stayinalive.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* EINCOCKUNG! *") ) then
				timerduration = 2
				PlaySoundFile("Interface\\AddOns\\preparedMod\\eincockung.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* Yes, I eat the fish *") ) then
				timerduration = 4
				PlaySoundFile("Interface\\AddOns\\preparedMod\\fish.ogg", "Master")
			elseif ( string.find( arg1, "* I WILL KEIN BARBIEPUPPENBLOND! *") ) then
				timerduration = 7
				PlaySoundFile("Interface\\AddOns\\preparedMod\\karamelblond.ogg", "Master")
				DoEmote("dance")
			elseif ( string.find( arg1, "* Ich wars ned man ... *") ) then
				timerduration = 2
				PlaySoundFile("Interface\\AddOns\\preparedMod\\wasntme.ogg", "Master")
				DoEmote("no")
			elseif ( string.find( arg1, "* Meine T Shirts sind Nachthemden! *") ) then
				timerduration = 10
				PlaySoundFile("Interface\\AddOns\\preparedMod\\shirts.ogg", "Master")
		    else
				return false
	        end
		-- else
		-- 	timeleft = (floodtime + timerduration) - actual_time
		-- 	DEFAULT_CHAT_FRAME:AddMessage("preparedMod floodprotection active for "..floor(timeleft).." seconds.")
		-- end
	end
end

function prepared_command(msg)
	
	-- raid?! officer?!
	if (GetNumGroupMembers() == 0) then
		raidCheck = 1
	else
		if (UnitIsGroupAssistant("player")) or (UnitIsGroupLeader("player")) then
			raidCheck = 1
		else
			raidCheck = 0
		end
	end
	
	if (msg == "mute") then
			--mute / unmute preparedmod
			if (preparedmute == 0) then
				preparedmute = 1
				DEFAULT_CHAT_FRAME:AddMessage("preparedMod MUTED! No more Sounds..")
			else
				preparedmute = 0
				DEFAULT_CHAT_FRAME:AddMessage("preparedMod UNMUTED! Sounds can be heared again..")
			end
	end
	if (msg == "help") then
			--display all commands
			DEFAULT_CHAT_FRAME:AddMessage("preparedMod usage: /prepared <msg>")
			DEFAULT_CHAT_FRAME:AddMessage("<msg> Commands: help, timer, mute")
			DEFAULT_CHAT_FRAME:AddMessage("<msg> Commands, Sound: wipe, batman, gummibears, ninjaturtles, aktex, slickslack, fuck, alive, eincockung, fish, blond, wasntme, shirts")
	end
	
	if (raidCheck == 1) then
		if (msg == "wipe") then
			SendChatMessage("* OMG WIPE!! *", "YELL")
		elseif (msg == "aktex") then
			SendChatMessage("* The Truth Is Out There.. *", "YELL")
		elseif (msg == "batman") then
			SendChatMessage("* BATMAAAAAAAAAAN! *", "YELL")
		elseif (msg == "gummibears") then
			SendChatMessage("* GUMMIBEARS! *", "YELL")
		elseif (msg == "ninjaturtles") then
			SendChatMessage("* TEENAGE MUTANT NINJATURTLES! *", "YELL")
		elseif (msg == "slickslack") then
			SendChatMessage("* SlickSlack *", "YELL")
		elseif (msg == "fuck") then
			SendChatMessage("* FUUUUUUUCK *", "YELL")
		elseif (msg == "alive") then
			SendChatMessage("* STAYIN' ALIVE! *", "YELL")
		elseif (msg == "eincockung") then
			SendChatMessage("* EINCOCKUNG! *", "YELL")
		elseif (msg == "fish") then
			SendChatMessage("* Yes, I eat the fish *", "YELL")
		elseif (msg == "blond") then
			SendChatMessage("* I WILL KEIN BARBIEPUPPENBLOND! *", "YELL")
		elseif (msg == "wasntme") then
			SendChatMessage("* Ich wars ned man ... *", "YELL")
		elseif (msg == "shirts") then
			SendChatMessage("* Meine T Shirts sind Nachthemden! *", "YELL")
		elseif (msg == "timer") then
			--get the actual timer (can't you wait?!)
			actual_time = GetTime()
			if ( (floodtime + timerduration) < actual_time ) then
				DEFAULT_CHAT_FRAME:AddMessage("Timer is ready!")
			else
				timeleft = (floodtime + timerduration) - actual_time
				DEFAULT_CHAT_FRAME:AddMessage("preparedMod floodprotection active for "..floor(timeleft).." seconds.")
			end
		else
			--no <msg>, just yell 'da orkish yell! ;-)
			SendChatMessage("* WAAAAAGH!! *", "YELL")
			DoEmote("roar")
			preparedtime = GetTime()
		end
	else
		--what a pity; not officer in a raid.
		DEFAULT_CHAT_FRAME:AddMessage("You are in a raid but no officer! |cff00ff00prepared Mod |cffffffffdisabled!")
	end
end
