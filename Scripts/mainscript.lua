--------------------------------------------------------------------------------------------------------
function AcceptAdventure() -- принятие любого приключения(астрал/ик/искажение/отряды)
if Activate then
local res = {}
res["choice"] = 1
local questions = questionLib.GetQuestions()
if questions[0] then
  local question = questionLib.GetInfo( questions[0] )
  if question.questionData then
	for k,v in pairs( question.questionData ) do
		if v.text then
		local text = userMods.FromWString(v.text)
		local m = string.format("Пункт назначения: «». Вы хотите прекратить поиск группы и немедленно отправиться туда%s", "?") -- начало приключения
		local d = string.format("Начато сражение: «». Вы готовы отправиться туда%s", "?") -- респ/возврат
		local mm = string.format("Выбрано сражение: «». Вы готовы вступить в очередь%s", "?")
		local dd = string.format("[] предлагает вам занять пассажирское место Молнии. Вы согласны%s", "?") -- начало приключения
			if m == text  and AA  then
			questionLib.SendData( questions[0], res )
			elseif d == text  and AA  then
			questionLib.SendData( questions[0], res)
			elseif mm == text and AR then
			questionLib.SendData( questions[0], res)
			elseif dd == text and AAM then
			questionLib.SendData( questions[0], res)
						end 
					end
				end 
			end
		end 
	end
end
--------------------------------------------------------------------------------------------------------
function MachmakingEnd ( params )
if Activate and MME then
local info = matchMaking.GetCurrentBattleInfo()
if not info.isPvE then
      matchMaking.ExitBattleEvent()
		end 
	end 
end

function AvatarStatus()
if Activate and ARA then
if matchMaking.IsAvatarInMatchMakingEvent() then
local info = matchMaking.GetCurrentBattleInfo()
if not info.isPvE and not userMods.FromWString(info.name) =="Лабиринт" then
if not avatar.IsAlive() then
	avatar.Respawn()
elseif avatar.IsAlive() then
  return end 
end 
end 
end 
end 

function Init()
common.RegisterEventHandler( AvatarStatus , "EVENT_AVATAR_ALIVE_CHANGED")
common.RegisterEventHandler( MachmakingEnd , "EVENT_MATCH_MAKING_EVENT_PROGRESS_COMPLETED_CHANGED")
common.RegisterEventHandler( AcceptAdventure, "EVENT_QUESTION_ADDED" )
end 

Init()