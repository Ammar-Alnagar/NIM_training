import random

proc displayBoard(board: seq[seq[char]]) =
  for row in board:
    for cell in row:
      stdout.write cell, " "
    echo ""

proc initializeBoard(rows, cols: int): seq[seq[char]] =
  result = newSeq[seq[char]](rows)
  for i in 0..<rows:
    result[i] = newSeq[char](cols)
    for j in 0..<cols:
      result[i][j] = '.'

proc placeSnake(board: var seq[seq[char]], headRow, headCol: int) =
  board[headRow][headCol] = 'H'

proc placeFood(board: var seq[seq[char]]) =
  var emptyCells: seq[(int, int)] = @[]
  for i in 0..<board.len:
    for j in 0..<board[i].len:
      if board[i][j] == '.':
        emptyCells.add((i, j))
  if emptyCells.len > 0:
    let (foodRow, foodCol) = emptyCells[rand(0..<emptyCells.len)]
    board[foodRow][foodCol] = 'F'

proc isValidMove(board: seq[seq[char]], row, col: int): bool =
  row >= 0 and row < board.len and col >= 0 and col < board[0].len and board[row][col] != 'S'

proc gameLoop() =
  let rows = 10
  let cols = 10
  var board = initializeBoard(rows, cols)
  var headRow = rows div 2
  var headCol = cols div 2
  var snakeBody: seq[(int, int)] = @[]
  placeSnake(board, headRow, headCol)
  placeFood(board)
  var gameOver = false
  var direction = 'd'

  while not gameOver:
    displayBoard(board)
    echo "Enter direction (w/a/s/d): "
    var input: string
    stdin.read(input)
    if input.len > 0:
        direction = input[0]
    
    var