---- Author: mj-- Date: 2018-05-18 -- 管理资源加载local LoadTaskManager = class("LoadTaskManager");LoadTaskManager.instance = nilfunction LoadTaskManager:ctor()	self.task_file_list = {}	self.all_file_num = 0	self.loaded_file_num = 0	self.finishCall = nil	self.progressCall = nil	self.loadPathList={}	self.loadingList={}	self.loadMax=10	self.loadcount=0	self.oneLoadcallback = function(texture)		self.loadcount = self.loadcount - 1		-- cclog(">>>>>>>>>> allback self.loadcount %d",self.loadcount)		if texture then			local path=texture:getPath()			local key=string.sub(path,string.find(path,"UI/"),string.len(path))		 	if self.loadPathList[key] then				cclog(">>>>>>>>>>oneLoadcallback :%s",key)				for i,callback in ipairs(self.loadPathList[key].calllist) do					callback(texture)				end				self.loadPathList[key] = nil			end		end	end	self.listLoaded = function(texture)		if self.iskeep and texture then			texture:retain()		end		self.loaded_file_num = self.loaded_file_num + 1		if self.progressCall then			self.progressCall(self.loaded_file_num/self.all_file_num*100)		end		local file = table.remove(self.task_file_list,1)		if file then			cclog(">>>>>>>>>>self.all_file_num :%s",file )			cc.Director:getInstance():getTextureCache():addImageAsync("UI/"..file, self.listLoaded)		else			cclog(">>>>>>>>>>finishCall")			if self.finishCall then				self.finishCall()			end		end	end	local function update(interval)		self:update(interval)	end	self.updatetimer = cc.Director:getInstance():getScheduler():scheduleScriptFunc(update,0,false)endfunction LoadTaskManager:getInstance()    if not LoadTaskManager.instance then      	 LoadTaskManager.instance = LoadTaskManager:create()     end    return LoadTaskManager.instanceendfunction LoadTaskManager:AddTask(_filelist,_finishcall,_progresscall)end--iskeep 是否常驻在内存function LoadTaskManager:AddAsyncTask(_filelist,_finishcall,_progresscall,iskeep)	self.iskeep = iskeep	self.loaded_file_num = 0	self.task_file_list = _filelist	self.finishCall = _finishcall	self.progressCall = _progresscall	self.all_file_num = #self.task_file_list	local file = table.remove(self.task_file_list,1)	cclog(">>>>>>>>>>self.all_file_num :%s",file )	cc.Director:getInstance():getTextureCache():addImageAsync("UI/"..file, self.listLoaded)endfunction LoadTaskManager:update(interval)	if self.loadcount>=self.loadMax then		return	end	local len = #self.loadingList	if len > 0 then		-- cclog(">>>>>>>>>>loadingList %d",#self.loadingList)		local nowN=self.loadMax-self.loadcount		-- cclog(">>>>>>>>>>nowN %d",nowN)		if nowN>len then nowN=len end		local i = 1		while i <= nowN do			local file=table.remove(self.loadingList,1)			if file then				cclog(">>>>>>>>>>load :%s",file)				self.loadcount=self.loadcount+1				cc.Director:getInstance():getTextureCache():addImageAsync(file,self.oneLoadcallback)				i=i+1			else				break			end		end	endendfunction LoadTaskManager:AddLoadOneTask(_filePath,_callback)	-- cclog(">>>>>>>>>>AddLoadOneTask :%s",_filePath)	local havefile=cc.Director:getInstance():getTextureCache():getTextureForKey("UI/".._filePath)	if havefile then		-- cclog(">>>>>>>>>>havefile :%s",_filePath)		_callback(havefile)		return	end	if not self.loadPathList["UI/".._filePath] then		self.loadPathList["UI/".._filePath]={filePath=_filePath,calllist={_callback}}		self:addtoloading("UI/".._filePath)	else		table.insert(self.loadPathList["UI/".._filePath].calllist,_callback)	endendfunction LoadTaskManager:stopAllloadListTask()	cc.Director:getInstance():getTextureCache():unbindAllImageAsync()	self.task_file_list = {}endfunction LoadTaskManager:stoploadOneTask(_filePath)	cc.Director:getInstance():getTextureCache():unbindImageAsync("UI/".._filePath)endfunction LoadTaskManager:stopAllloadOneTask()	cc.Director:getInstance():getTextureCache():unbindAllImageAsync()	self.loadPathList={}	self.loadingList={}endfunction LoadTaskManager:addtoloading(_filePath)	table.insert(self.loadingList,_filePath)endreturn LoadTaskManager