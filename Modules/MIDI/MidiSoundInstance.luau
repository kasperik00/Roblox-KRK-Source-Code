
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
CreatedMidiSoundInstances = {} -- Setting global
local tbl_upvr = {
	ChineseTransliteration = true;
	KoreanTransliteration = true;
	JapaneseTransliteration = true;
	RussianTransliteration = true;
	ThaiTransliteration = true;
}
function clampNormal(arg1, arg2, arg3) -- Line 21
	if arg3 < arg2 then
		error("Min value must be greater than max value", 2)
	end
	if arg3 < arg1 then
	end
	if arg3 < arg2 then
	end
	return (arg2 - arg2) / (arg3 - arg2)
end
local module_upvr = {
	IsLoaded = false;
	MidiId = "";
	_lastMidiId = "";
	_busy = false;
	TimeLength = 0;
	RollOffMaxDistance = 65;
	RollOffMinDistance = 20;
	Looped = false;
	PlaybackSpeed = 1;
	Playing = false;
	TimePosition = 0;
	CurrentMidiClock = 0;
	Pitch = 1;
	Volume = 0.5;
	SoundInstance = nil;
}
module_upvr.__index = module_upvr
function module_upvr.getMidiSounds() -- Line 77
	local module = {}
	for _, v in CreatedMidiSoundInstances do
		table.insert(module, v)
	end
	return module
end
local module_upvr_2 = require(ReplicatedStorage_upvr.Modules:WaitForChild("MIDI"):WaitForChild("WrappedDMIP"))
function module_upvr.get(arg1) -- Line 84
	--[[ Upvalues[2]:
		[1]: module_upvr (readonly)
		[2]: module_upvr_2 (readonly)
	]]
	if arg1 ~= nil and (typeof(arg1) ~= "Instance" or not arg1:IsA("Sound") or not arg1:HasTag("midiSoundObject")) then
		if not arg1:HasTag("midiSoundObject") then
			error("Sound in argument #1 is not midiSoundObject tagged", 2)
		end
		error("Argument #1 is not a Sound", 2)
	end
	if CreatedMidiSoundInstances[arg1 or -1] ~= nil then
		return CreatedMidiSoundInstances[arg1]
	end
	if arg1 == nil then
		local Sound = Instance.new("Sound")
		Sound:AddTag("midiSoundObject")
		Sound.Name = "MidiSoundObject"
	end
	local setmetatable_result1 = setmetatable({}, {
		__index = module_upvr;
	})
	setmetatable_result1._DmipUpdatedBind = Instance.new("BindableEvent")
	setmetatable_result1.DmipUpdated = setmetatable_result1._DmipUpdatedBind.Event
	setmetatable_result1._EndedBind = Instance.new("BindableEvent")
	setmetatable_result1.Ended = setmetatable_result1._EndedBind.Event
	setmetatable_result1.SoundInstance = Sound
	setmetatable_result1.WrappedDMIP = module_upvr_2.new()
	CreatedMidiSoundInstances[Sound] = setmetatable_result1
	return setmetatable_result1
end
function module_upvr.Resume(arg1) -- Line 114
	arg1.Playing = true
end
function module_upvr.Pause(arg1) -- Line 117
	if arg1.Playing then
		arg1.Playing = false
		arg1._EndedBind:Fire()
	end
end
function module_upvr.Play(arg1) -- Line 123
	if not arg1.Playing then
		arg1.Playing = true
		arg1.CurrentMidiClock = arg1.StartMidiClock
	end
	arg1.TimePosition = 0
end
function module_upvr.Stop(arg1) -- Line 130
	arg1.Playing = false
	arg1.TimePosition = 0
	arg1.CurrentMidiClock = arg1.StartMidiClock
	arg1._EndedBind:Fire()
end
function module_upvr.ForcePreload(arg1) -- Line 136
	if arg1.task_delay_thread1 then
		pcall(function() -- Line 138
			--[[ Upvalues[1]:
				[1]: arg1 (readonly)
			]]
			task.cancel(arg1.task_delay_thread1)
		end)
		arg1.task_delay_thread1 = nil
	end
	if arg1._busy then
	else
		arg1._lastMidiId = game:GetService("HttpService"):GenerateGUID(false)
	end
end
function module_upvr.Destroy(arg1) -- Line 146
	if CreatedMidiSoundInstances[arg1.SoundInstance] ~= nil then
		CreatedMidiSoundInstances[arg1.SoundInstance] = nil
	end
	arg1.WrappedDMIP:Clear()
	arg1._DmipUpdatedBind:Fire()
	arg1._DmipUpdatedBind:Destroy()
	arg1._EndedBind:Destroy()
	if typeof(arg1.SoundInstance) == "Instance" and arg1.SoundInstance:IsDescendantOf(game) then
		arg1.SoundInstance:Destroy()
		arg1.SoundInstance = nil
	end
end
spawn(function() -- Line 160
	while task.wait() do
		for _, v_2 in CreatedMidiSoundInstances do
			local SoundInstance = v_2.SoundInstance
			if SoundInstance then
				SoundInstance.RollOffMaxDistance = v_2.RollOffMaxDistance
				SoundInstance.RollOffMinDistance = v_2.RollOffMinDistance
				SoundInstance.RollOffMode = Enum.RollOffMode.Linear
			end
		end
	end
end)
local RunService_upvr = game:GetService("RunService")
local module_upvr_3 = require(ReplicatedStorage_upvr:WaitForChild("Modules"):WaitForChild("SongsDownloader"))
spawn(function() -- Line 172
	--[[ Upvalues[4]:
		[1]: RunService_upvr (readonly)
		[2]: module_upvr_3 (readonly)
		[3]: ReplicatedStorage_upvr (readonly)
		[4]: tbl_upvr (readonly)
	]]
	while true do
		local var21_upvw
		var21_upvw = "BindableEvent"
		local any_upvr = Instance.new(var21_upvw)
		var21_upvw = nil
		if RunService_upvr:IsClient() then
			var21_upvw = RunService_upvr.RenderStepped:Connect(function(arg1) -- Line 177
				--[[ Upvalues[1]:
					[1]: any_upvr (readonly)
				]]
				any_upvr:Fire(arg1)
			end)
		else
			var21_upvw = RunService_upvr.Stepped:Connect(function(arg1, arg2) -- Line 181
				--[[ Upvalues[1]:
					[1]: any_upvr (readonly)
				]]
				any_upvr:Fire(arg2)
			end)
		end
		xpcall(function() -- Line 185
			--[[ Upvalues[6]:
				[1]: any_upvr (readonly)
				[2]: RunService_upvr (copied, readonly)
				[3]: module_upvr_3 (copied, readonly)
				[4]: ReplicatedStorage_upvr (copied, readonly)
				[5]: tbl_upvr (copied, readonly)
				[6]: var21_upvw (read and write)
			]]
			-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
			while true do
				for _, v_3_upvr in CreatedMidiSoundInstances do
					local var34
					local function INLINED() -- Internal function, doesn't exist in bytecode
						var34 = v_3_upvr.SoundInstance.Parent.Position
						return var34
					end
					if v_3_upvr.SoundInstance == nil or v_3_upvr.SoundInstance.Parent == nil or not v_3_upvr.SoundInstance.Parent:IsA("BasePart") or not INLINED() then
						var34 = nil
					end
					if not RunService_upvr:IsClient() or var34 == nil or not (1 - clampNormal((var34 - workspace.CurrentCamera.CFrame.Position).Magnitude, v_3_upvr.RollOffMinDistance, v_3_upvr.RollOffMaxDistance)) then
						local const_number = 1
					end
					if v_3_upvr.Playing and v_3_upvr.IsLoaded then
						v_3_upvr.TimePosition = math.clamp(v_3_upvr.TimePosition + any_upvr.Event:Wait() * v_3_upvr.PlaybackSpeed, 0, v_3_upvr.TimeLength)
						if v_3_upvr.TimeLength <= v_3_upvr.TimePosition then
							if v_3_upvr.Looped then
								v_3_upvr.TimePosition = 0
							else
								v_3_upvr:Stop()
							end
						end
						if 0 < const_number then
							v_3_upvr.CurrentMidiClock = v_3_upvr.WrappedDMIP:TimePositionToMidiClock(v_3_upvr.TimePosition)
						end
					end
					if v_3_upvr._lastMidiId ~= v_3_upvr.MidiId and not v_3_upvr._busy and 0 < const_number then
						v_3_upvr._busy = true
						spawn(function() -- Line 209
							--[[ Upvalues[5]:
								[1]: v_3_upvr (readonly)
								[2]: module_upvr_3 (copied, readonly)
								[3]: RunService_upvr (copied, readonly)
								[4]: ReplicatedStorage_upvr (copied, readonly)
								[5]: tbl_upvr (copied, readonly)
							]]
							-- KONSTANTERROR: [0] 1. Error Block 18 start (CF ANALYSIS FAILED)
							if v_3_upvr.MidiId == "" then
								v_3_upvr:Stop()
								v_3_upvr.WrappedDMIP:Clear()
								v_3_upvr.IsLoaded = false
								v_3_upvr._busy = false
							else
								local any_DownloadMidiAsync_result1_upvr = module_upvr_3:DownloadMidiAsync(v_3_upvr.MidiId)
								local function fail(arg1) -- Line 219
									--[[ Upvalues[3]:
										[1]: RunService_upvr (copied, readonly)
										[2]: ReplicatedStorage_upvr (copied, readonly)
										[3]: v_3_upvr (copied, readonly)
									]]
									if RunService_upvr:IsClient() then
										local any_new_result1_3 = require(ReplicatedStorage_upvr.Modules.Client.GUIS.PopUpMessageObject).new()
										any_new_result1_3:SetImage("rbxassetid://17070533911")
										any_new_result1_3:SetMessage(`Song {v_3_upvr.MidiId} : {any_new_result1_3} . Retrying 5 seconds`, Color3.fromRGB(198, 0, 3))
										any_new_result1_3:SetVisibility(true)
										any_new_result1_3:AutoDelete()
									end
									v_3_upvr.WrappedDMIP:Clear()
									v_3_upvr._DmipUpdatedBind:Fire()
									v_3_upvr.IsLoaded = false
									v_3_upvr._busy = false
									if v_3_upvr.task_delay_thread1 then
										pcall(function() -- Line 233
											--[[ Upvalues[1]:
												[1]: v_3_upvr (copied, readonly)
											]]
											task.cancel(v_3_upvr.task_delay_thread1)
										end)
										v_3_upvr.task_delay_thread1 = nil
									end
									v_3_upvr.task_delay_thread1 = task.delay(5, function() -- Line 238
										--[[ Upvalues[1]:
											[1]: v_3_upvr (copied, readonly)
										]]
										if v_3_upvr.SoundInstance and v_3_upvr.SoundInstance:IsDescendantOf(game) then
											v_3_upvr.task_delay_thread1 = nil
											v_3_upvr:ForcePreload()
										else
											v_3_upvr.task_delay_thread1 = nil
										end
									end)
								end
								if any_DownloadMidiAsync_result1_upvr ~= nil then
									v_3_upvr.WrappedDMIP.SongDataObjectReference = any_DownloadMidiAsync_result1_upvr
									local pcall_result1, pcall_result2 = pcall(function() -- Line 249
										--[[ Upvalues[2]:
											[1]: any_DownloadMidiAsync_result1_upvr (readonly)
											[2]: v_3_upvr (copied, readonly)
										]]
										if #any_DownloadMidiAsync_result1_upvr.MidiRawData == 0 then
											return v_3_upvr.WrappedDMIP.new()
										end
										v_3_upvr.WrappedDMIP:WrapDMIPAsync(any_DownloadMidiAsync_result1_upvr.MidiRawData)
										v_3_upvr._DmipUpdatedBind:Fire()
									end)
									if pcall_result1 then
										v_3_upvr.IsLoaded = true
										v_3_upvr.TimeLength = v_3_upvr.WrappedDMIP.TimeLength
										v_3_upvr._busy = false
										if RunService_upvr:IsClient() then
											local SUserSettings_upvr = require(ReplicatedStorage_upvr.Modules.Client.SUserSettings)
											local PopUpMessageObject_upvr = require(ReplicatedStorage_upvr.Modules.Client.GUIS.PopUpMessageObject)
											local Color3_fromRGB_result1_upvr = Color3.fromRGB(132, 132, 1)
											local function doo(arg1, arg2, arg3, arg4, arg5) -- Line 265
												--[[ Upvalues[5]:
													[1]: any_DownloadMidiAsync_result1_upvr (readonly)
													[2]: tbl_upvr (copied, readonly)
													[3]: SUserSettings_upvr (readonly)
													[4]: PopUpMessageObject_upvr (readonly)
													[5]: Color3_fromRGB_result1_upvr (readonly)
												]]
												if any_DownloadMidiAsync_result1_upvr.MidiHasLyrics and table.find(any_DownloadMidiAsync_result1_upvr.SongLanguageId, arg1) and tbl_upvr[arg2] and SUserSettings_upvr:GetSetting(arg3) == false then
													tbl_upvr[arg2] = false
													local any_new_result1_upvr = PopUpMessageObject_upvr.new()
													any_new_result1_upvr:SetMessage(`Would you like to show the romanized lyrics of this {arg5} song?`, Color3_fromRGB_result1_upvr)
													any_new_result1_upvr:SetImage("rbxassetid://16578283713")
													any_new_result1_upvr:SetButtons({"Yes", "No"})
													any_new_result1_upvr:SetVisibility(true)
													any_new_result1_upvr.ButtonClickEvent:Connect(function(arg1_2) -- Line 273
														--[[ Upvalues[7]:
															[1]: any_new_result1_upvr (readonly)
															[2]: PopUpMessageObject_upvr (copied, readonly)
															[3]: arg5 (readonly)
															[4]: Color3_fromRGB_result1_upvr (copied, readonly)
															[5]: arg4 (readonly)
															[6]: SUserSettings_upvr (copied, readonly)
															[7]: arg3 (readonly)
														]]
														any_new_result1_upvr:Destroy()
														if arg1_2 == 1 then
															local any_new_result1_2 = PopUpMessageObject_upvr.new()
															any_new_result1_2:SetMessage(`Some {arg5} songs will now display romanized lyrics. You can toggle lyrics romanization in menu > settings > lyrics`, Color3_fromRGB_result1_upvr)
															any_new_result1_2:SetImage(arg4)
															any_new_result1_2:SetVisibility(true)
															any_new_result1_2:AutoDelete()
															SUserSettings_upvr:SetSetting(arg3, true)
														else
															local any_new_result1 = PopUpMessageObject_upvr.new()
															any_new_result1:SetMessage("You can toggle lyrics romanization in menu > settings > lyrics", Color3_fromRGB_result1_upvr)
															any_new_result1:SetImage(arg4)
															any_new_result1:SetVisibility(true)
															any_new_result1:AutoDelete(5)
														end
													end)
													any_new_result1_upvr:AutoDelete(60)
												end
											end
											doo(2, "ChineseTransliteration", "lyricsModule_romanizedHanzi", "rbxassetid://16578283713", "Chinese")
											doo(12, "KoreanTransliteration", "lyricsModule_romanizedHangul", "rbxassetid://16578283713", "Korean")
											doo(16, "RussianTransliteration", "lyricsModule_romanizedCyrillic", "rbxassetid://16578283713", "Russian")
											doo(11, "JapaneseTransliteration", "lyricsModule_romanizedJapanese", "rbxassetid://16578283713", "Japanese")
											doo(19, "ThaiTransliteration", "lyricsModule_romanizedThai", "rbxassetid://16578283713", "Thai")
											-- KONSTANTWARNING: GOTO [177] #140
										end
									else
										Color3_fromRGB_result1_upvr = v_3_upvr.WrappedDMIP
										SUserSettings_upvr = Color3_fromRGB_result1_upvr.Sequences
										Color3_fromRGB_result1_upvr = nil
										PopUpMessageObject_upvr = setmetatable
										PopUpMessageObject_upvr(SUserSettings_upvr, Color3_fromRGB_result1_upvr)
										PopUpMessageObject_upvr = warn
										SUserSettings_upvr = pcall_result2
										PopUpMessageObject_upvr(SUserSettings_upvr)
										PopUpMessageObject_upvr = fail
										SUserSettings_upvr = "Failed to parse DMIP"
										PopUpMessageObject_upvr(SUserSettings_upvr)
									end
								else
									v_3_upvr.WrappedDMIP.SongDataObjectReference = nil
									PopUpMessageObject_upvr = "Song "
									SUserSettings_upvr = v_3_upvr.MidiId
									Color3_fromRGB_result1_upvr = " download failed"
									warn(PopUpMessageObject_upvr..SUserSettings_upvr..Color3_fromRGB_result1_upvr)
									fail("Download failed")
								end
								-- KONSTANTERROR: [0] 1. Error Block 18 end (CF ANALYSIS FAILED)
								-- KONSTANTERROR: [177] 140. Error Block 11 start (CF ANALYSIS FAILED)
								PopUpMessageObject_upvr = v_3_upvr
								v_3_upvr._lastMidiId = PopUpMessageObject_upvr.MidiId
								-- KONSTANTERROR: [177] 140. Error Block 11 end (CF ANALYSIS FAILED)
							end
						end)
					end
				end
			end
			any_upvr:Destroy()
			var21_upvw:Disconnect()
		end, function(arg1) -- Line 317
			warn(arg1)
		end)
		task.wait(1)
	end
end)
return module_upvr
