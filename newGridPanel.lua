-- Examples

local ui = require 'plugin.ui_framework'
ui:init()

local gridPanel = ui.newGridPanel({
  width = 200,
  height = 200,
  rows = {"*",10,"*"}, -- "*" = equal size, number = pixels
  columns = {"*","*"},
  debug = true -- show colored rects under grid.
})

local rect = display.newRect(0,0, 20, 20)
rect.grid = {row = 1, columns = 2} -- each display object requires grid table with column and row index values. this allows object to be inserted in correct cell.
gridPanel:insert(rect) -- object has to be inserted into grid panel, cannot be added at object created. First create object and then insert it into gridPanel.

