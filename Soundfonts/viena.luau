local module_3 = {
	Name = "Viena";
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
local module_upvr_2 = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Client"):WaitForChild("MidiSynth"):WaitForChild("InstrumentSampleObject"))
local module_2_upvr = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("rbxgameassetRedirect"))
function module_3.GetSound(arg1, arg2, arg3, arg4, arg5) -- Line 60
	--[[ Upvalues[4]:
		[1]: tbl_upvr (readonly)
		[2]: module_upvr_2 (readonly)
		[3]: tbl_upvr_2 (readonly)
		[4]: module_2_upvr (readonly)
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
	local module_upvr = {}
	local const_number_upvw = 0
	local function check() -- Line 83
		--[[ Upvalues[8]:
			[1]: var26_upvw (read and write)
			[2]: arg4 (readonly)
			[3]: arg5 (readonly)
			[4]: module_upvr_2 (copied, readonly)
			[5]: tbl_upvr_2 (copied, readonly)
			[6]: module_2_upvr (copied, readonly)
			[7]: const_number_upvw (read and write)
			[8]: module_upvr (readonly)
		]]
		-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
		local var45
		local function INLINED() -- Internal function, doesn't exist in bytecode
			var45 = var26_upvw
			return var45
		end
		if var26_upvw == nil or not INLINED() then
			var45 = {}
		end
		for i_3, v_3 in var45 do
			local KeyRange = v_3.KeyRange
			local VelocityRange = v_3.VelocityRange
			if KeyRange[1] <= arg4 and arg4 <= KeyRange[2] and VelocityRange[1] <= arg5 and arg5 <= VelocityRange[2] then
				local var48 = v_3
			end
		end
		if var48 then
			var45 = module_upvr_2.new()
			i_3 = nil
			for i_4, v_4 in var48.Envelope, nil, i_3 do
				var45.Envelope[i_4] = v_4
			end
			i_3 = var48.SampleId
			local var49 = tbl_upvr_2[i_3]
			local SampleName = var49.SampleName
			i_3 = module_2_upvr:pass("rbxgameasset://Audio/"..SampleName:sub(0, #SampleName - 4))
			var45.SoundId = i_3
			i_3 = var48.Loop
			var45.Loop = i_3
			i_3 = var48.NoteOffset
			var45.NoteOffset = i_3
			i_3 = var48.RootKey
			var45.RootKey = i_3
			local function INLINED_2() -- Internal function, doesn't exist in bytecode
				i_3 = (1 + -var48.Attenuation / 25) * arg5
				return i_3
			end
			if var48.Attenuation >= 0 or not INLINED_2() then
				i_3 = (1 - math.clamp(var48.Attenuation / 25, 0, 1)) * arg5
			end
			var45.VolumeMultiplier = i_3
			i_3 = var48.Filter_cutoff
			var45.Filter_cutoff = i_3
			i_3 = var45.Region
			i_3.Min = var49.StartTime
			i_3.Max = var49.EndTime
			i_3.MinLoop = var49.StartLoop
			i_3.MaxLoop = var49.EndLoop
			if const_number_upvw == 128 then
			else
			end
			var45.VolumeMultiplier *= 0.65
			table.insert(module_upvr, var45)
		end
	end
	check()
	if #module_upvr == 0 then
		-- KONSTANTERROR: Expression was reused, decompilation is incorrect
		var26_upvw = tbl_upvr[0][0]
		check()
	end
	return module_upvr
end
return module_3
