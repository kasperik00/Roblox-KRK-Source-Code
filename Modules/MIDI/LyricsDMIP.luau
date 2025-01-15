local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
if LocalPlayer_upvr then
	LocalPlayer_upvr = require(ReplicatedStorage_upvr.Modules:WaitForChild("Client"):WaitForChild("SUserSettings"))
end
local function ChunkSplitSpacesSafe_upvr(arg1) -- Line 16, Named "ChunkSplitSpacesSafe"
	local module_11 = {}
	local const_number = 1
	local var7
	for i = 1, #arg1 do
		local var8
		if arg1:sub(const_number, i - 1) ~= ' ' then
			var8 = false
		else
			var8 = true
		end
		if var8 ~= true then
			if not var8 and false then
				table.insert(module_11, arg1:sub(var7, const_number - 1))
				var7 = const_number
			end
		end
	end
	table.insert(module_11, arg1:sub(var7, #arg1))
	return module_11
end
local function ChunkSplitSpaces_upvr(arg1) -- Line 37, Named "ChunkSplitSpaces"
	--[[ Upvalues[1]:
		[1]: ChunkSplitSpacesSafe_upvr (readonly)
	]]
	local module_6_upvr = {}
	local var10_upvw = 0
	local var12_upvw = true
	local var13_upvw = false
	if pcall(function() -- Line 40
		--[[ Upvalues[5]:
			[1]: arg1 (readonly)
			[2]: var12_upvw (read and write)
			[3]: var13_upvw (read and write)
			[4]: module_6_upvr (readonly)
			[5]: var10_upvw (read and write)
		]]
		for i_2, v in utf8.graphemes(arg1) do
			local var21
			if #arg1:sub(i_2, v):gsub("%s", "") ~= 0 then
				var21 = false
			else
				var21 = true
			end
			if var21 ~= var12_upvw then
				var12_upvw = var21
				if not var21 and var13_upvw then
					table.insert(module_6_upvr, arg1:sub(var10_upvw, i_2 - 1))
					var10_upvw = i_2
				end
				var13_upvw = true
			end
		end
	end) then
		table.insert(module_6_upvr, arg1:sub(var10_upvw, #arg1))
		return module_6_upvr
	end
	return ChunkSplitSpacesSafe_upvr(arg1)
end
local function ChunkSplitNextLines_upvr(arg1) -- Line 62, Named "ChunkSplitNextLines"
	local module_3 = {}
	for _, v_2 in arg1:split('\n') do
		table.insert(module_3, v_2)
		table.insert(module_3, '\n')
	end
	table.remove(module_3, #module_3)
	return module_3
end
local function _(arg1, arg2, arg3) -- Line 71, Named "clampNormal"
	return (math.clamp(arg1, arg2, arg3) - arg2) / (arg3 - arg2)
end
local function trim_upvr(arg1, arg2) -- Line 74, Named "trim"
	if arg2 then
		for i_4 = #arg1, 1, -1 do
			if arg1:sub(i_4, i_4) ~= ' ' then
				return arg1:sub(0, i_4)
			end
		end
		return arg1
	end
	for i_5 = 1, #arg1 do
		if arg1:sub(i_5, i_5) ~= ' ' then
			return arg1:sub(i_5, #arg1)
		end
	end
	return arg1
end
local module_15_upvr = {
	FullLines = {};
	LyricsTrack = {};
	_characterSize = {};
	_graphemes_cache = {};
	_FontAssetIds_Cache = {};
	_connections = {};
	MaxCharacters = 30;
	CharactersCount = 0;
	ApplySettings = true;
}
module_15_upvr.__index = module_15_upvr
function module_15_upvr.new() -- Line 118
	--[[ Upvalues[2]:
		[1]: module_15_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
	]]
	local setmetatable_result1_upvr = setmetatable({
		FullLines = {};
		LyricsTrack = {};
	}, module_15_upvr)
	if LocalPlayer_upvr then
		setmetatable_result1_upvr._connections[1] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_ignoreNextlineExceptWrap"):Connect(function() -- Line 125
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
		setmetatable_result1_upvr._connections[2] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_blindMode"):Connect(function() -- Line 128
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
		setmetatable_result1_upvr._connections[3] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_forceUppercase"):Connect(function() -- Line 131
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
		setmetatable_result1_upvr._connections[4] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_maxCharacters"):Connect(function() -- Line 134
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
		setmetatable_result1_upvr._connections[5] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedHangul"):Connect(function() -- Line 137
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
		setmetatable_result1_upvr._connections[6] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedHanzi"):Connect(function() -- Line 140
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
		setmetatable_result1_upvr._connections[7] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedCyrillic"):Connect(function() -- Line 143
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
		setmetatable_result1_upvr._connections[8] = LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_noAccentMarkers"):Connect(function() -- Line 146
			--[[ Upvalues[1]:
				[1]: setmetatable_result1_upvr (readonly)
			]]
			setmetatable_result1_upvr:Reload()
		end)
	end
	return setmetatable_result1_upvr
end
function module_15_upvr.applyMidiClockOffset(arg1, arg2) -- Line 153
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	local any_GetSetting_result1 = LocalPlayer_upvr:GetSetting("lyricsModule_timeoffset")
	if 0.05 < any_GetSetting_result1 ^ 2 and arg1 then
		return arg1:TimePositionToMidiClock(arg1:MidiClockToTimePosition(arg2) + any_GetSetting_result1)
	end
	return arg2
end
function module_15_upvr.getMainTrackAccountingRomanize(arg1, arg2) -- Line 160
	--[[ Upvalues[1]:
		[1]: LocalPlayer_upvr (readonly)
	]]
	if arg1 == nil then
		return "@main"
	end
	if not arg1.SongDataObjectReference or not arg1.SongDataObjectReference.SongLanguageId then
		local tbl_2 = {}
	end
	if type(arg2) ~= "boolean" then
	end
	if LocalPlayer_upvr and true then
		if LocalPlayer_upvr:GetSetting("lyricsModule_romanizedCyrillic") and table.find(tbl_2, 16) then
		elseif LocalPlayer_upvr:GetSetting("lyricsModule_romanizedHangul") and table.find(tbl_2, 12) then
		elseif LocalPlayer_upvr:GetSetting("lyricsModule_romanizedHanzi") and table.find(tbl_2, 2) then
		elseif LocalPlayer_upvr:GetSetting("lyricsModule_romanizedJapanese") and table.find(tbl_2, 11) then
		elseif LocalPlayer_upvr:GetSetting("lyricsModule_romanizedThai") and table.find(tbl_2, 19) then
		end
	end
	if table.find(arg1.RegisteredLyrics, "@main_romanized") and (table.find(arg1.RegisteredLyrics, "@main") == nil or true) then
		return "@main_romanized"
	end
	return "@main"
end
function module_15_upvr.Destroy(arg1) -- Line 195
	arg1:Clear()
	for _, v_3 in arg1._connections do
		v_3:Disconnect()
	end
	table.clear(arg1._connections)
end
function module_15_upvr.UpdateUIText(arg1, arg2, arg3) -- Line 202
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 41 start (CF ANALYSIS FAILED)
	local var47_upvw = false
	pcall(function() -- Line 204
		--[[ Upvalues[2]:
			[1]: arg3 (readonly)
			[2]: var47_upvw (read and write)
		]]
		for _, v_4 in utf8.codes(arg3.Text) do
			if 1536 <= v_4 and v_4 <= 1791 then
				var47_upvw = true
			end
		end
	end)
	local var54
	if var54 <= 0 then
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var54 = Vector2.new(0.75, 0)
			return var54
		end
		if not var47_upvw or not INLINED() then
			var54 = Vector2.new(-0.75, 0)
		end
		-- KONSTANTWARNING: GOTO [78] #60
	end
	-- KONSTANTERROR: [0] 1. Error Block 41 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 23. Error Block 45 start (CF ANALYSIS FAILED)
	local var55
	if arg3.MaxGraphemes <= arg3.Graphemes then
		if not var47_upvw or not Vector2.new(-0.75, 0) then
		end
	else
		local any_NormalizeRelativeToFont_result1 = arg1:NormalizeRelativeToFont(arg3.Text, arg3.Graphemes / math.max(arg3.MaxGraphemes, 1), arg2.FontFace)
		if not var47_upvw or not Vector2.new(0.5 - any_NormalizeRelativeToFont_result1, 0) then
		end
	end
	arg2.Text = arg3.Text
	local class_UIGradient = arg2:FindFirstChildWhichIsA("UIGradient")
	local var58
	if class_UIGradient then
		class_UIGradient.Offset = Vector2.new(any_NormalizeRelativeToFont_result1 - 0.5, 0)
		if var47_upvw then
			var58 = 180
		else
			var58 = 0
		end
		class_UIGradient.Rotation = var58
	end
	-- KONSTANTERROR: [27] 23. Error Block 45 end (CF ANALYSIS FAILED)
end
function module_15_upvr.GetInterlude(arg1, arg2, arg3) -- Line 227
	-- KONSTANTERROR: [0] 1. Error Block 35 start (CF ANALYSIS FAILED)
	local any_GetLineIndex_result1 = arg1:GetLineIndex(arg3)
	if arg1.FullLines[any_GetLineIndex_result1] and arg1.FullLines[any_GetLineIndex_result1].Lyrics[1] and arg3 < arg1.FullLines[any_GetLineIndex_result1].Lyrics[1].Time then
	else
	end
	local _ = -2
	-- KONSTANTERROR: [0] 1. Error Block 35 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [91] 66. Error Block 25 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [91] 66. Error Block 25 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [32] 25. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	-- KONSTANTERROR: [32] 25. Error Block 8 end (CF ANALYSIS FAILED)
end
function module_15_upvr.GetLineAt(arg1, arg2, arg3) -- Line 252
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var117 = arg1.FullLines[arg2]
	if var117 then
		if var117.StartTime <= arg3 then
			local var118
			if arg3 <= var118 then
				var118 = ""
				for _, v_5 in var117.Lyrics do
					if v_5.Time <= arg3 and arg3 <= v_5.EndTime then
						local Time_2 = v_5.Time
						local EndTime = v_5.EndTime
					end
					var118 = var118..v_5.Data
				end
				local module_14 = {
					MaxGraphemes = #var118;
					Text = var118;
					Graphemes = #var118 + (math.clamp(arg3, Time_2, EndTime) - Time_2) / (EndTime - Time_2) * #v_5.Data;
					StartTime = var117.StartTime;
					EndTime = var117.EndTime;
				}
				module_14.LineIndex = arg2
				return module_14
			end
		end
		var118 = var117.StartTime
		if arg3 <= var118 then
			var118 = ""
			for _, _ in var117.Lyrics do
				-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [84.9]
				var118 = var118..nil.Data
			end
			local module_9 = {
				MaxGraphemes = #var118;
				Text = var118;
				Graphemes = 0;
				StartTime = var117.StartTime;
				EndTime = var117.EndTime;
			}
			module_9.LineIndex = arg2
			return module_9
		end
		if var117.EndTime <= arg3 then
			for _, v_7 in var117.Lyrics do
			end
			local module_4 = {
				MaxGraphemes = #""..v_7.Data;
			}
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			module_4.Text = ""..v_7.Data
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			module_4.Graphemes = #""..v_7.Data
			module_4.StartTime = var117.StartTime
			module_4.EndTime = var117.EndTime
			module_4.LineIndex = arg2
			return module_4
		end
	end
	local module = {
		MaxGraphemes = 0;
		Text = ' ';
		Graphemes = 0;
		StartTime = 0;
		EndTime = 0;
	}
	module.LineIndex = arg2
	return module
end
function module_15_upvr.GetLineIndex(arg1, arg2) -- Line 309
	for i_11, v_8 in arg1.FullLines do
		if v_8.StartTime <= arg2 and arg2 <= v_8.EndTime then
			return i_11
		end
	end
	if arg1.FullLines[1] and arg2 < arg1.FullLines[1].StartTime then
		return 1
	end
	return #arg1.FullLines
end
function module_15_upvr.Clear(arg1) -- Line 321
	table.clear(arg1.LyricsTrack)
	table.clear(arg1.FullLines)
	arg1.CharactersCount = 0
end
local module_7_upvr = require(ReplicatedStorage_upvr.Modules:WaitForChild("RomanizeTools"):WaitForChild("LuauHangul"))
local var128_upvw
local module_upvr = require(ReplicatedStorage_upvr.Modules:WaitForChild("RomanizeTools"):WaitForChild("LuauCyrillic"))
local module_13_upvr = require(ReplicatedStorage_upvr.Modules.RomanizeTools:WaitForChild("PinyinUtil"))
local module_2_upvr = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("TableUtil"))
function module_15_upvr.Reload(arg1) -- Line 326
	--[[ Upvalues[10]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: module_7_upvr (readonly)
		[3]: var128_upvw (read and write)
		[4]: ReplicatedStorage_upvr (readonly)
		[5]: module_upvr (readonly)
		[6]: ChunkSplitNextLines_upvr (readonly)
		[7]: ChunkSplitSpaces_upvr (readonly)
		[8]: module_13_upvr (readonly)
		[9]: trim_upvr (readonly)
		[10]: module_2_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	-- KONSTANTERROR: [0] 1. Error Block 104 start (CF ANALYSIS FAILED)
	local var164_upvw
	if arg1.ApplySettings and LocalPlayer_upvr then
		var164_upvw = LocalPlayer_upvr:GetSetting("lyricsModule_romanizedHangul")
		local any_GetSetting_result1_upvw_2 = LocalPlayer_upvr:GetSetting("lyricsModule_romanizedHanzi")
	end
	local LyricsTrack = arg1.LyricsTrack
	local tbl = {}
	arg1.CharactersCount = 0
	local var168
	for i_12, v_9 in LyricsTrack do
		if i_12 ~= 1 then
			local var169 = 0
			local Data_upvw = v_9.Data
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				var168 = v_9.Time
				return var168
			end
			if i_12 ~= #LyricsTrack or not INLINED_2() then
				var168 = v_9.EndTime
			end
			var168 = pcall
			var168(function() -- Line 367
				--[[ Upvalues[3]:
					[1]: var164_upvw (read and write)
					[2]: Data_upvw (read and write)
					[3]: module_7_upvr (copied, readonly)
				]]
				if var164_upvw then
					Data_upvw = module_7_upvr:RomanizeWhole(Data_upvw)
				end
			end)
			var168 = pcall
			var168(function() -- Line 372
				--[[ Upvalues[4]:
					[1]: any_GetSetting_result1_upvw_2 (read and write)
					[2]: var128_upvw (copied, read and write)
					[3]: ReplicatedStorage_upvr (copied, readonly)
					[4]: Data_upvw (read and write)
				]]
				if any_GetSetting_result1_upvw_2 then
					if var128_upvw == nil then
						var128_upvw = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("RomanizeTools"):WaitForChild("LuauHanzi"))
					end
					Data_upvw = var128_upvw:RomanizeWhole(Data_upvw)
				end
			end)
			var168 = pcall
			local any_GetSetting_result1_upvw = LocalPlayer_upvr:GetSetting("lyricsModule_romanizedCyrillic")
			var168(function() -- Line 380
				--[[ Upvalues[3]:
					[1]: any_GetSetting_result1_upvw (read and write)
					[2]: Data_upvw (read and write)
					[3]: module_upvr (copied, readonly)
				]]
				if any_GetSetting_result1_upvw then
					Data_upvw = module_upvr:RomanizeWhole(Data_upvw)
				end
			end)
			var168 = #Data_upvw
			for _, v_10 in ChunkSplitNextLines_upvr(Data_upvw) do
				for i_14, v_11 in ChunkSplitSpaces_upvr(v_10) do
					table.insert({}, v_11)
					local var182
				end
			end
			local var183
			for _, v_12 in var182 do
				if LocalPlayer_upvr:GetSetting("lyricsModule_blindMode") then
					local function INLINED_3() -- Internal function, doesn't exist in bytecode
						var183 = '.':rep(#v_12)
						return var183
					end
					if v_12 == ' ' or v_12 == '\n' or not INLINED_3() then
						var183 = v_12
					end
					v_12 = var183
				elseif LocalPlayer_upvr:GetSetting("lyricsModule_forceUppercase") then
					if any_GetSetting_result1_upvw_2 then
						var183 = module_13_upvr:Upper(v_12)
						v_12 = var183
					else
						var183 = v_12:upper()
						v_12 = var183
					end
				end
				if LocalPlayer_upvr:GetSetting("lyricsModule_noAccentMarkers") and any_GetSetting_result1_upvw_2 then
					var183 = module_13_upvr:RemoveAccentMarkers(v_12)
					v_12 = var183
				end
				i_14 = v_9.Data
				i_14 = v_9.EndTime
				v_11 = v_9.Time
				var183 = var169 / #i_14 * (i_14 - v_11)
				if var183 ~= var183 then
					var183 = 0
				end
				local var184 = v_9.Time + var183
				i_14 = 0
				if i_14 < #tbl then
					i_14 = #tbl
					tbl[i_14].EndTime = var184
				end
				v_11 = {}
				v_11.Time = var184
				v_11.EndTime = v_9.EndTime
				v_11.Data = v_12
				i_14 = tbl
				table.insert(i_14, v_11)
			end
			arg1.CharactersCount += var169 + #v_12
		end
	end
	if 0 < #tbl then
		tbl[#tbl].EndTime = var168
	end
	local var185_upvw = 0
	local var186_upvw = 1
	local var187_upvw = false
	local function _(arg1_2) -- Line 432, Named "NextLine"
		--[[ Upvalues[3]:
			[1]: var186_upvw (read and write)
			[2]: var185_upvw (read and write)
			[3]: var187_upvw (read and write)
		]]
		var186_upvw += 1
		var185_upvw = 0
		var187_upvw = arg1_2
	end
	table.clear(arg1.FullLines)
	local function _(arg1_3) -- Line 440, Named "add"
		--[[ Upvalues[4]:
			[1]: arg1 (readonly)
			[2]: var186_upvw (read and write)
			[3]: var187_upvw (read and write)
			[4]: var185_upvw (read and write)
		]]
		if arg1.FullLines[var186_upvw] == nil then
			arg1.FullLines[var186_upvw] = {
				Lyrics = {};
				StartTime = 0;
				EndTime = 0;
				MaxCharacters = 0;
				AutoWrapped = var187_upvw;
			}
			var187_upvw = false
		end
		local var189 = arg1.FullLines[var186_upvw]
		table.insert(var189.Lyrics, arg1_3)
		local var190_upvw = 0
		xpcall(function() -- Line 457
			--[[ Upvalues[2]:
				[1]: arg1_3 (readonly)
				[2]: var190_upvw (read and write)
			]]
			for _ in utf8.graphemes(arg1_3.Data) do
				var190_upvw += 1
			end
		end, function() -- Line 461
			--[[ Upvalues[2]:
				[1]: var190_upvw (read and write)
				[2]: arg1_3 (readonly)
			]]
			var190_upvw = 0
			for _ in #arg1_3.Data do
				var190_upvw += 1
			end
		end)
		var185_upvw += var190_upvw
		var189.MaxCharacters += var190_upvw
	end
	-- KONSTANTERROR: [0] 1. Error Block 104 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [309] 246. Error Block 52 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [309] 246. Error Block 52 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [257] 204. Error Block 144 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: Expression was reused, decompilation is incorrect
	if (arg1.CharactersCount) + (var169 + #v_12) == '\n' then
		if not LocalPlayer_upvr:GetSetting("lyricsModule_ignoreNextlineExceptWrap") then
		else
		end
	elseif math.min(arg1.MaxCharacters, LocalPlayer_upvr:GetSetting("lyricsModule_maxCharacters")) < var185_upvw then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		if nil then
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			if nil < nil then
				-- KONSTANTWARNING: GOTO [309] #246
			end
		else
		end
	end
	-- KONSTANTERROR: [257] 204. Error Block 144 end (CF ANALYSIS FAILED)
end
function module_15_upvr.Load(arg1, arg2) -- Line 555
	arg1:Clear()
	for i_18, v_13 in arg2 do
		arg1.LyricsTrack[i_18] = v_13
	end
	arg1:Reload()
end
local ContentProvider_upvr = game:GetService("ContentProvider")
local TextService_upvr = game:GetService("TextService")
function module_15_upvr.NormalizeRelativeToFont(arg1, arg2, arg3, arg4) -- Line 563
	--[[ Upvalues[2]:
		[1]: ContentProvider_upvr (readonly)
		[2]: TextService_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 6. Error Block 57 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [10.8]
	if nil == arg4 then
		if nil == nil then
			arg1._characterSize[arg4] = {}
		end
		for _, v_14 in arg1._graphemes_cache do
			for i_20, v_15 in v_14 do
				if v_15.LastUpdate < time() - 10 then
					v_14[i_20] = nil
				end
			end
		end
		-- KONSTANTWARNING: GOTO [53] #41
	end
	-- KONSTANTERROR: [6] 6. Error Block 57 end (CF ANALYSIS FAILED)
end
local BindableEvent_upvr = Instance.new("BindableEvent")
module_15_upvr.RomanizedSettingsChanged = BindableEvent_upvr.Event
if LocalPlayer_upvr then
	local function fire() -- Line 696
		--[[ Upvalues[1]:
			[1]: BindableEvent_upvr (readonly)
		]]
		BindableEvent_upvr:Fire()
	end
	LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedCyrillic"):Connect(fire)
	LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedHangul"):Connect(fire)
	LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedHanzi"):Connect(fire)
	LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedJapanese"):Connect(fire)
	LocalPlayer_upvr:GetSettingChangedEvent("lyricsModule_romanizedThai"):Connect(fire)
	BindableEvent_upvr:Fire()
end
return module_15_upvr
