local module_3 = {
	Name = "Roland SC-55/88";
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local tbl_upvr_2 = {}
for _, v in require(script:WaitForChild("SamplesMetaData")) do
	v.SampleId = nil
	tbl_upvr_2[v.SampleId] = v
end
local tbl_upvr = {}
for _, v_2 in require(script:WaitForChild("InstrumentsMetaData")), nil do
	local _2 = v_2[2]
	local _1 = v_2[1]
	local var19 = tbl_upvr[_2]
	if var19 == nil then
		tbl_upvr[_2] = {}
		var19 = tbl_upvr[_2]
	end
	local var20 = var19[_1]
	if var20 == nil then
		var19[_1] = {}
		var20 = var19[_1]
	end
	table.insert(var20, {
		SampleId = v_2[3];
		KeyRange = v_2[4];
		VelocityRange = v_2[5];
		Loop = v_2[6];
		RootKey = v_2[7];
		NoteOffset = v_2[8] / 100;
		Attenuation = v_2[9];
		Filter_cutoff = v_2[10];
		ScaleTuning = v_2[11];
		Envelope = {
			Attack = v_2[12][1] / 1000;
			Hold = v_2[12][2] / 1000;
			Decay = v_2[12][3] / 1000;
			SustainMultiplier = math.clamp(1 - v_2[12][4] / 20, 0, 1);
			Release = v_2[12][5] / 1000;
		};
	})
end
module_3.banks = tbl_upvr
local module_upvr = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Client"):WaitForChild("MidiSynth"):WaitForChild("InstrumentSampleObject"))
local module_4_upvr = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("rbxgameassetRedirect"))
function module_3.GetSound(arg1, arg2, arg3, arg4, arg5) -- Line 59
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: module_upvr (readonly)
		[3]: tbl_upvr_2 (readonly)
		[4]: module_4_upvr (readonly)
	]]
	-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
	local var25 = tbl_upvr[arg2]
	if var25 == nil then
		var25 = tbl_upvr[0]
	end
	local var26_upvw = var25[arg3]
	if var26_upvw == nil then
		if 0 == 128 then
			var26_upvw = tbl_upvr[128][0]
		else
			-- KONSTANTERROR: Expression was reused, decompilation is incorrect
			var26_upvw = tbl_upvr[0][0]
		end
	end
	if var26_upvw == nil then
		return {}
	end
	local module_2_upvr = {}
	local const_number_upvw = 0
	local function check() -- Line 82
		--[[ Upvalues[8]:
			[1]: var26_upvw (read and write)
			[2]: arg4 (readonly)
			[3]: arg5 (readonly)
			[4]: module_upvr (copied, readonly)
			[5]: tbl_upvr_2 (copied, readonly)
			[6]: module_4_upvr (copied, readonly)
			[7]: const_number_upvw (read and write)
			[8]: module_2_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var69
		local function INLINED_3() -- Internal function, doesn't exist in bytecode
			var69 = var26_upvw
			return var69
		end
		if var26_upvw == nil or not INLINED_3() then
			var69 = {}
		end
		for _, v_3 in var69 do
			local KeyRange_2 = v_3.KeyRange
			if KeyRange_2[1] <= arg4 and arg4 <= KeyRange_2[2] and v_3.VelocityRange[1] <= arg5 then
				-- KONSTANTERROR: Expression was reused, decompilation is incorrect
				local var71
				if arg5 <= v_3.VelocityRange[2] then
					var71 = nil
					for i_4, v_4 in v_3.Envelope, nil, var71 do
						module_upvr.new().Envelope[i_4] = v_4
						local var73
					end
					var71 = v_3.SampleId
					local var74 = tbl_upvr_2[var71]
					local SampleName_2 = var74.SampleName
					var71 = module_4_upvr:pass("rbxgameasset://Audio/"..SampleName_2:sub(0, #SampleName_2 - 4))
					var73.SoundId = var71
					var71 = v_3.Loop
					var73.Loop = var71
					var71 = v_3.NoteOffset
					var73.NoteOffset = var71
					var71 = v_3.RootKey
					var73.RootKey = var71
					local function INLINED_4() -- Internal function, doesn't exist in bytecode
						var71 = (1 + -v_3.Attenuation / 25) * arg5
						return var71
					end
					if v_3.Attenuation >= 0 or not INLINED_4() then
						var71 = (1 - math.clamp(v_3.Attenuation / 25, 0, 1)) * arg5
					end
					var73.VolumeMultiplier = var71
					var71 = v_3.Filter_cutoff
					var73.Filter_cutoff = var71
					var71 = var73.Region
					var71.Min = var74.StartTime
					var71.Max = var74.EndTime
					var71.MinLoop = var74.StartLoop
					var71.MaxLoop = var74.EndLoop
					if const_number_upvw == 128 then
					else
					end
					var73.VolumeMultiplier *= 0.65
					table.insert(module_2_upvr, var73)
				end
			end
		end
	end
	check()
	if #module_2_upvr == 0 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		var26_upvw = tbl_upvr[0][0]
		check()
	end
	return module_2_upvr
end
return module_3
