local MainSignal = Signal.New("MainSignal")

LocalSpeechProxy.OnReceive("Casino_LocalProxy", function(proxy, mtype, speaker, level, text)
	Signal.Send("MainSignal", { creature = speaker, message = text} )
end)

EffectMessageProxy.OnReceive("Casino_EffectProxy", function(proxy, message, x, y, z)
	local Rolled_Number = string.match(message, Self.Name().." rolled a (.+).")
	if (Rolled_Number) then
		Signal.Send("MainSignal", (Rolled_Number + 0))
	end
end)
