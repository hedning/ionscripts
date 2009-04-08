
function WFrame:tabbedclient_create()

if not tabname then 
	local tabname = "browser"
end

	local tabbed = self:attach_new({ type="WFrame", name=tabname})
	tabbed:set_mode("tiled")
end

function WRegion:nth_parent (nth)
	
	if not nth then
		nth = 1
	elseif nth == 0 then
		return self

	end

	local region = self

	for i=1, nth do
		region = region:parent()
	end
	
	return region

end
	

--returns the nth parent of WFrame as 
--long as that's a frame nil otherwise
function WFrame:tabbedclient_nth(nth) 
	
	if not nth then
		nth = 1
	end

	if nth == 0 then 
		return self
	end
		

	local framein = self
	local frameout

	for i=1, nth do 
		frameout = framein
		framein = framein:manager()
	end
	
	if framein.__typename == "WFrame" then
		frameout = framein	
	end

	return frameout
		
end

-- returns the frame whom's parent is WRootWin
function WFrame:topframe ()

	local frame = self

	while frame:parent().__typename == "WFrame" do 
		frame = frame:parent()
	end

	return frame
end
