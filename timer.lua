colorName = "White"
color = Color.fromString(colorName)
self.setColorTint(color)

totalTime = 0

function onLoad()
  self.Clock.setValue(0)
  self.Clock.paused = true
end

-- event --
function onPlayerTurn(playerNew, playerPrev)
  if playerPrev.color == colorName then
    printTimes(playerPrev)
    
    self.Clock.paused = true
  elseif playerNew.color == colorName then
    self.Clock.startStopwatch()
    self.Clock.paused = false
  end
end

function printTimes(player)
  local turnTime = self.Clock.getValue()
  if turnTime ~= 0 then
    local timeMin = math.floor(turnTime / 60)
    local timeSec = turnTime % 60
    printToAll(player.steam_name..'\'s turn time: '..timeMin..' minutes and '..timeSec..' seconds.', Color.fromString(player.color))
    
    totalTime = totalTime + turnTime
    timeMin = math.floor(totalTime / 60)
    timeSec = totalTime % 60
    printToAll(player.steam_name..'\'s total time: '..timeMin..' minutes and '..timeSec..' seconds.', Color.fromString(player.color))
  end
end
