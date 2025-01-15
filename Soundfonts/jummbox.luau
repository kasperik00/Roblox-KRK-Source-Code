local module = {
	uploads = require(script:WaitForChild("uploads"));
	meta = game:GetService("HttpService"):JSONDecode(require(script:WaitForChild("meta")));
	rootDir = "rbxasset://custom/karaoke_instruments/";
	cache = {};
	Name = "Jummbox GS";
}
local module_upvr = require(game:GetService("ReplicatedStorage").Modules:WaitForChild("Client"):WaitForChild("MidiSynth"):WaitForChild("InstrumentSampleObject"))
function module.GetSound(arg1, arg2, arg3, arg4, arg5) -- Line 12
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 47 start (CF ANALYSIS FAILED)
	if arg2 == 128 then
	end
	local meta = arg1.meta
	if arg2 == 128 then
		meta = "128"
	else
		meta = '0'
	end
	-- KONSTANTERROR: [0] 1. Error Block 47 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [46] 38. Error Block 16 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [46] 38. Error Block 16 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 17. Error Block 8 start (CF ANALYSIS FAILED)
	-- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [46.14]
	-- KONSTANTERROR: [20] 17. Error Block 8 end (CF ANALYSIS FAILED)
end
return module
