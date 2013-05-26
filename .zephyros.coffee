# treats the screen like a grid, and lets you move/resize windows along it

mash = ["cmd", "alt", "ctrl"]
mash_shift = ["cmd", "alt", "shift"]

if (typeof grid_width == 'undefined')
  grid_width = 4

api.settings().alertAnimates = false
api.settings().alertDisappearDelay = 2

# - Bindings

bind "R", ["cmd", "alt", "ctrl"], -> reloadConfig()

bind "=", mash, -> changeGridWidth grid_width + 1
bind "-", mash, -> changeGridWidth grid_width - 1

bind "H", mash_shift, -> api.focusedWindow().focusWindowLeft()
bind "L", mash_shift, -> api.focusedWindow().focusWindowRight()
bind "K", mash_shift, -> api.focusedWindow().focusWindowUp()
bind "J", mash_shift, -> api.focusedWindow().focusWindowDown()


# snap this window to grid
bind ";", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  moveToGridProps win, r

# snap all windows to grid
bind "'", mash, ->
  _.each api.visibleWindows(), (win) ->
    r = gridProps(win)
    moveToGridProps win, r

# maximize
bind "M", mash, ->
  win = api.focusedWindow()
  screenRect = win.screen().frameWithoutDockOrMenu()
  win.setFrame screenRect

# move left
bind "H", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  r.origin.x = Math.max(r.origin.x - 1, 0)
  moveToGridProps win, r

# move right
bind "L", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  r.origin.x = Math.min(r.origin.x + 1, grid_width - r.size.width)
  moveToGridProps win, r

# grow to right
bind "O", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  r.size.width = Math.min(r.size.width + 1, grid_width - r.origin.x)
  moveToGridProps win, r

# shrink from right
bind "I", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  r.size.width = Math.max(r.size.width - 1, 1)
  moveToGridProps win, r

# move to upper row
bind "K", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  r.origin.y = 0
  r.size.height = 1
  moveToGridProps win, r

# move to lower row
bind "J", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  r.origin.y = 1
  r.size.height = 1
  moveToGridProps win, r

# fill whole vertical column
bind "U", mash, ->
  win = api.focusedWindow()
  r = gridProps(win)
  r.origin.y = 0
  r.size.height = 2
  moveToGridProps win, r


# ~~~  helper functions ~~~
changeGridWidth = (n) ->
  grid_width = n
  alert "Grid is now " + grid_width + " tiles wide"

gridProps = (win) ->
  winFrame = win.frame()
  screenRect = win.screen().frameWithoutDockOrMenu()
  thirdScrenWidth = screenRect.size.width / grid_width
  halfScreenHeight = screenRect.size.height / 2.0
  CGRectMake Math.round((winFrame.origin.x - NSMinX(screenRect)) / thirdScrenWidth),
             Math.round((winFrame.origin.y - NSMinY(screenRect)) / halfScreenHeight),
             Math.max(Math.round(winFrame.size.width / thirdScrenWidth), 1),
             Math.max(Math.round(winFrame.size.height / halfScreenHeight), 1)

moveToGridProps = (win, gridProps) ->
  moveToGridPropsOnScreen win, win.screen(), gridProps

moveToGridPropsOnScreen = (win, screen, gridProps) ->
  screenRect = screen.frameWithoutDockOrMenu()
  thirdScrenWidth = screenRect.size.width / grid_width
  halfScreenHeight = screenRect.size.height / 2.0
  newFrame = CGRectMake((gridProps.origin.x * thirdScrenWidth) + NSMinX(screenRect),
                        (gridProps.origin.y * halfScreenHeight) + NSMinY(screenRect),
                        gridProps.size.width * thirdScrenWidth,
                        gridProps.size.height * halfScreenHeight)
  newFrame = NSInsetRect(newFrame, 0, 0) # acts as a little margin between windows, to give shadows some breathing room
  newFrame = NSIntegralRect(newFrame)
  win.setFrame newFrame

# -----------------------------------------------------------------------------

bind 'E', ['cmd'], -> shell '/usr/bin/say', [api.selectedText()]